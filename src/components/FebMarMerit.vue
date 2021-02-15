<template>
  <v-card class="mx-auto">
    <v-data-table
      dense
      hide-default-footer
      disable-pagination
      mobile-breakpoint="200"
      :headers="headers"
      :items="players"
      :sort-by="['total', 'chips']"
      :sort-desc="['true', 'true']"
    ></v-data-table>
  </v-card>
</template>

<script>
export default {
  name: "SeasonStandings",
  props: {
    msg: String,
  },
  data() {
    return {
      headers: [
        {
          text: "Player",
          align: "start",
          sortable: false,
          value: "name",
        },
        { text: "Total", value: "total" },
        { text: "Chips", value: "chips" },
        { text: "2/1", value: "game1" },
        { text: "2/5", value: "game2" },
        { text: "2/8", value: "game3" },
        { text: "2/12", value: "game4" },
        { text: "2/14", value: "game5" },
        { text: "2/15", value: "game6" },
        { text: "2/19", value: "game7" },
        { text: "2/26", value: "game8" },
      ],
      players: [
        {
          name: "BigMike",
          chips: 800,
          game1: 3,
          game2: 2,
          game4: 2,
        },
        {
          name: "Foley",
          chips: 400,
        },
        {
          name: "Matthew",
          chips: 600,
          game3: 3,
        },
        {
          name: "Anders",
          chips: 800,
          game4: 5,
        },
        {
          name: "Christine",
          chips: 800,
          game1: 5,
        },
        {
          name: "Kat",
          chips: 400,
        },
        {
          name: "Alex",
          chips: 800,
          game2: 3,
          game4: 3,
        },
        {
          name: "Shane",
          chips: 1100,
          game1: 4,
          game3: 5,
        },
        {
          name: "Chris",
          chips: 700,
          game2: 4,
        },
        {
          name: "Iustin",
          chips: 700,
          game2: 5,
        },
        { 
          name: "Alejandro",
          chips: 200,
        },
        { 
          name: "Jim",
          chips: 200,
        },
        { 
          name: "Miller",
          chips: 600,
          game4: 4,
        },
        { 
          name: "Brito",
          chips: 200,
        },
        { 
          name: "Derik",
          chips: 200,
        },
        { 
          name: "David",
          chips: 300,
        },
        { 
          name: "Jess",
          chips: 500,
          game3: 4,
        },
        { 
          name: "Alex T",
          chips: 100,
        },
        { 
          name: "Kevin",
          chips: 100,
        },
        { 
          name: "Ned",
          chips: 100,
        },
        { 
          name: "Nancy",
          chips: 100,
        },
      ],
    };
  },
  methods: {
    calcTotalInPlayers() {
      this.players.map((el) => {
        el.total = 0;
        for (let key in el) {
          if (key.substring(0, 4) === "game" || key === "bye") {
            el.total += el[key];
            if (el[key] === 5) {
              el[key] = "5🥇";
            } else if (el[key] === 4) {
              el[key] = "4🥈";
            } else if (el[key] === 3) {
              el[key] = "3🥉";
            }
          }
        }
        el.chips = el.chips + 1500;
        return el;
      });
      return this.players;
    },
    addPositionInPlayers() {
      this.players.sort((a, b) => {
        if (b.total - a.total == 0) {
          return b.name < a.name ? 1 : -1;
        }
        return b.total - a.total;
      });
      this.players.map((el, index) => {
        if (index === 0) {
          el.position = "🥇";
        } else if (index === 1) {
          el.position = "🥈";
        } else if (index === 2) {
          el.position = "🥉";
        } else {
          el.position = index + 1;
        }
      });
      return this.players;
    },
  },
  created() {
    this.calcTotalInPlayers();
    this.addPositionInPlayers();
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
