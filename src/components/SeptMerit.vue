<template>
  <v-card class="mx-auto">
    <v-card-title>September Merit Rankings</v-card-title>
    <v-data-table
      dense
      hide-default-footer
      disable-pagination
      mobile-breakpoint="200"
      :headers="headers"
      :items="players"
      :sort-by="['total', 'name']"
      :sort-desc="['true']"
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
        { text: "8/31", value: "game1" },
        { text: "9/4", value: "game2" },
        { text: "9/7", value: "game3" },
        { text: "9/11", value: "game4" },
        { text: "9/14", value: "game5" },
        { text: "9/18", value: "game6" },
        { text: "9/21", value: "game7" },
        { text: "9/25", value: "game8" },
      ],
      players: [
        {
          name: "BigMike",
          game1: 3,
          game3: 4,
          game4: 2,
        },
        {
          name: "Matthew",
          game1: 5,
          game4: 3,
        },
        {
          name: "Anders",
          game1: 4,
          game2: 4,
        },
        {
          name: "David",
          game2: 5,
        },
        {
          name: "Atom",
          game4: 2,
        },
        {
          name: "Ned",
          game2: 3,
        },
        {
          name: "Kat",
          game2: 2,
          game3: 3,
        },
        {
          name: "Shane",
          game2: 2,
        },
        {
          name: "Derik",
          game3: 5,
          game4: 5,
        },
        {
          name: "Foley",
          game3: 2,
          game4: 4,
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
        el.chips = el.total * 100 + 1500;
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
