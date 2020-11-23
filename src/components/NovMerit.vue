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
        { text: "11/4", value: "game1" },
        { text: "11/6", value: "game2" },
        { text: "11/9", value: "game3" },
        { text: "11/13", value: "game4" },
        { text: "11/16", value: "game5" },
        { text: "11/20", value: "game6" },
        { text: "11/23", value: "game7" },
        { text: "11/27", value: "game8" },
      ],
      players: [
        {
          name: "BigMike",
          chips: 900,
          game2: 2,
          game5: 2,
          game6: 2,
        },
        {
          name: "Foley",
          chips: 900,
          game2: 5,
        },
        {
          name: "Matthew",
          chips: 1500,
          game1: 4,
          game2: 4,
          game3: 3,
          game4: 2,
        },
        {
          name: "Anders",
          chips: 600,
        },
        {
          name: "Atom",
          chips: 1000,
          game3: 5,
        },
        {
          name: "Ned",
          chips: 1000,
          game4: 4,
          game5: 3,
        },
        {
          name: "Christine",
          chips: 800,
          game1: 3,
        },
        {
          name: "Kat",
          chips: 700,
          game3: 2,
        },
        {
          name: "David",
          chips: 1100,
          game5: 4,
          game6: 3,
        },
        {
          name: "Derik",
          chips: 300,
        },
        {
          name: "Miller",
          chips: 1400,
          game4: 5,
          game5: 5,
        },
        {
          name: "Alex",
          chips: 900,
          game6: 5,
        },
        {
          name: "Jess",
          chips: 500,
          game3: 4,
        },
        {
          name: "Evi",
          chips: 1300,
          game1: 5,
          game2: 3,
          game4: 2,
        },
        {
          name: "Jon",
          chips: 200,
        },
        {
          name: "Shane",
          chips: 500,
          game4: 3,
        },
        {
          name: "Ben",
          chips: 200,
        },
        {
          name: "Thomas",
          chips: 200,
        },
        {
          name: "Tim",
          chips: 500,
          game6: 4,
        }
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
