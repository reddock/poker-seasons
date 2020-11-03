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
        { text: "8/31", value: "game1" },
        { text: "9/4", value: "game2" },
        { text: "9/7", value: "game3" },
        { text: "9/11", value: "game4" },
        { text: "9/14", value: "game5" },
        { text: "9/18", value: "game6" },
        { text: "9/21", value: "game7" },
      ],
      players: [
        {
          name: "BigMike",
          chips: 1800,
          game1: 3,
          game3: 4,
          game4: 2,
          game5: 5,
          game6: 2,
        },
        {
          name: "Matthew",
          finals: "2nd",
          chips: 1500,
          game1: 5,
          game4: 3,
          game7: 3,
        },
        {
          name: "Anders",
          chips: 1600,
          game1: 4,
          game2: 4,
          game6: 4,
        },
        {
          name: "David",
          finals: "3rd",
          chips: 1400,
          game2: 5,
          game7: 4,
        },
        {
          name: "Atom",
          finals: "1st",
          chips: 600,
          game4: 2,
        },
        {
          name: "Ben Pops",
          chips: 600,
          game6: 5,
        },
        {
          name: "Ned",
          chips: 600,
          game2: 3,
        },
        {
          name: "Kat",
          chips: 1000,
          game2: 2,
          game3: 3,
        },
        {
          name: "Shane",
          finals: "5th",
          chips: 1400,
          game2: 2,
          game6: 3,
          game7: 5,
        },
        {
          name: "Julio",
          chips: 700,
          game5: 4,
        },
        {
          name: "Alex",
          chips: 900,
          game5: 3,
          game7: 2,
        },
        {
          name: "Derik",
          chips: 1500,
          game3: 5,
          game4: 5,
          game6: 2,
        },
        {
          name: "Foley",
          chips: 1100,
          game3: 2,
          game4: 4,
        },
        {
          name: "Christine",
          finals: "4th",
          chips: 700,
        },
        {
          name: "Iustin",
          chips: 400,
        },
        {
          name: "Jess",
          chips: 500,
        },
        {
          name: "Robert",
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
