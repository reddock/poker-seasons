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
        { text: "Finals", value: "finals" },
        { text: "Chips", value: "chips" },
        { text: "3/26", value: "game1" },
        { text: "3/29", value: "game2" },
        { text: "4/2", value: "game3" },
        { text: "4/5", value: "game4" },
        { text: "4/12", value: "game5" },
        { text: "4/16", value: "game6" },
        { text: "4/19", value: "game7" },
        { text: "4/26", value: "game8" },
        { text: "5/3", value: "game9" },
        { text: "5/10", value: "game10" },
      ],
      players: [
        {
          name: "BigMike",
          chips: 1700,
          finals: "1st",
          game1: 3,
          game3: 2,
          game6: 3,
          game10: 3,
        },
        {
          name: "Foley",
          chips: 1300,
          finals: "3rd",
          game3: 4,
          game7: 3,
        },
        {
          name: "Evi",
          chips: 600,
          game1: 4,
        },
        {
          name: "Tolga",
          chips: 1400,
          game4: 5,
          game8: 4,
        },
        {
          name: "Anders",
          chips: 1500,
          game1: 2,
          game7: 4,
          game10: 4,
        },
        {
          name: "Matthew",
          chips: 800,
          game2: 5,
        },
        {
          name: "Christine",
          chips: 2000,
          game4: 4,
          game6: 4,
          game9: 5,
        },
        {
          name: "Kat",
          chips: 2000,
          game1: 5,
          game3: 5,
          game4: 3,
        },
        {
          name: "Alex",
          chips: 1700,
          finals: "4th",
          game4: 2, 
          game5: 4,
          game9: 4,
        },
        {
          name: "Shane",
          chips: 2100,
          game2: 4,
          game6: 5,
          game8: 3,
          game9: 3,
        },
        {
          name: "Nancy",
          chips: 1000,
        },
        {
          name: "Jess",
          chips: 700,
          game5: 3,
        },
        { 
          name: "Miller",
          chips: 1300,
          game2: 3,
          game8: 5,
        },
        { 
          name: "David",
          finals: "2nd",
          chips: 2000,
          game3: 3,
          game5: 5,
          game10: 5,
        },
        { 
          name: "Atom",
          chips: 400,
        },
        { 
          name: "Sunny",
          chips: 300,
        },
        { 
          name: "Ruiz",
          chips: 200,
        },
        { 
          name: "Derik",
          chips: 300,
        },
        { 
          name: "Shannon",
          chips: 200,
        },
        { 
          name: "Brito",
          chips: 900,
          game7: 5,
        },
        { 
          name: "Alejandro",
          chips: 200,
        },
        { 
          name: "Ned",
          chips: 200,
        },
        { 
          name: "Ben",
          chips: 200,
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
