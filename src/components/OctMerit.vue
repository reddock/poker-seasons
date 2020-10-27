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
        { text: "10/23", value: "game8" },
        { text: "10/26", value: "game9" },
      ],
      players: [
        {
          name: "BigMike",
          chips: 2300,
          game1: 5,
          game2: 5,
          game4: 2,
          game5: 3,
          game6: 2,
          game9: 3,
        },
        {
          name: "Matthew",
          chips: 2100,
          game1: 4,
          game2: 4,
          game3: 3,
          game7: 4,
          game9: 2,
        },
        {
          name: "Anders",
          chips: 1300,
          game2: 3,
          game8: 3,
        },
        {
          name: "Jess",
          chips: 1700,
          game1: 3,
          game3: 5,
          game5: 4,
          game7: 3,
        },
        {
          name: "Christine",
          chips: 800,
        },
        {
          name: "Foley",
          chips: 600,
        },
        {
          name: "Ned",
          chips: 1500,
          game4: 3,
          game5: 5,
          game8: 4,
        },
        {
          name: "Shane",
          chips: 1100,
          game6: 3,
        },
        {
          name: "Atom",
          chips: 1500,
          game4: 4,
          game9: 4,
        },
        {
          name: "Ben",
          chips: 1200,
          game4: 5,
          game6: 4,
          game8: 2,
        },
        {
          name: "Kat",
          chips: 1300,
          game9: 5,
        },
        {
          name: "David",
          chips: 1900,
          game3: 4,
          game6: 5,
          game7: 5,
        },
        {
          name: "Derik",
          chips: 500,
        },
        {
          name: "Miller",
          chips: 900,
          game8: 5,
        },
        {
          name: "Evi",
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
