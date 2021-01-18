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
        { text: "12/4", value: "game1" },
        { text: "12/11", value: "game2" },
        { text: "12/18", value: "game3" },
        { text: "12/26", value: "game4" },
        { text: "12/30", value: "game5" },
        { text: "1/1", value: "game6" },
        { text: "1/8", value: "game7" },
        { text: "1/15", value: "game8" },
        { text: "1/18", value: "game9" },
        { text: "1/22", value: "game10" },
      ],
      players: [
        {
          name: "BigMike",
          chips: 1300,
          game1: 5,
          game2: 2,
        },
        {
          name: "Foley",
          chips: 1100,
          game1: 2,
          game2: 2,
          game8: 2,
        },
        {
          name: "Matthew",
          chips: 1200,
          game4: 3,
          game5: 4,
        },
        {
          name: "Anders",
          chips: 900,
          game8: 2,
        },
        {
          name: "Atom",
          chips: 800,
          game3: 2,
        },
        {
          name: "Ned",
          chips: 1700,
          game1: 4,
          game2: 3,
          game4: 2,
          game6: 4,
        },
        {
          name: "Christine",
          chips: 1300,
          game3: 2,
          game4: 2,
          game6: 2,
          game7: 3,
        },
        {
          name: "Kat",
          chips: 1900,
          game2: 4,
          game3: 5,
          game7: 5,
        },
        {
          name: "David",
          chips: 1900,
          game2: 5,
          game5: 5,
          game8: 4,
        },
        {
          name: "Derik",
          chips: 700,
          game8: 3,
        },
        {
          name: "Miller",
          chips: 800,
          game1: 3,
        },
        {
          name: "Alex",
          chips: 1100,
          game1: 2,
          game7: 2,
          game8: 2,
        },
        {
          name: "Evi",
          chips: 800,
          game7: 2,
        },
        {
          name: "Shane",
          chips: 2000,
          game3: 3,
          game4: 5,
          game6: 3,
          game8: 5,
        },
        {
          name: "Iustin",
          chips: 700,
        },
        {
          name: "Tim",
          chips: 500,
        },
        {
          name: "Chris",
          chips: 800,
          game3: 4,
        },
        {
          name: "Jim",
          chips: 900,
          game5: 2,
          game7: 4,
        },
        {
          name: "Ben",
          chips: 800,
          game5: 3,
          game7: 2,
        },
        {
          name: "Jess",
          chips: 1100,
          game4: 4,
          game6: 5,
        },
        {
          name: "Craig",
          chips: 200,
        },
        {
          name: "Kevin",
          chips: 200,
        },
        {
          name: "Russell",
          chips: 200,
        },
        {
          name: "Beaux",
          chips: 200,
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
