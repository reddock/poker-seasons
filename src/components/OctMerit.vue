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
        { text: "9/28", value: "game1" },
        { text: "10/2", value: "game2" },
        { text: "10/5", value: "game3" },
        { text: "10/9", value: "game4" },
        { text: "10/12", value: "game5" },
        { text: "10/16", value: "game6" },
        { text: "10/19", value: "game7" },
        { text: "10/26", value: "game8" },
      ],
      players: [
        {
          name: "BigMike",
          chips: 1000,
          game1: 5,
          game2: 5,
        },
        {
          name: "Matthew",
          chips: 800,
          game1: 4,
          game2: 4,
        },
        {
          name: "Anders",
          chips: 400,
          game2: 3,
        },
        {
          name: "Jess",
          chips: 400,
          game1: 3,
        },
        {
          name: "Christine",
          chips: 200,
        },
        {
          name: "Foley",
          chips: 200,
        },
        {
          name: "Ned",
          chips: 200,
        },
        {
          name: "Shane",
          chips: 200,
        },
        {
          name: "Atom",
          chips: 200,
        },
        {
          name: "Kat",
          chips: 200,
        },
        {
          name: "David",
          chips: 200,
        },
        {
          name: "Derik",
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
