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
        { text: "1/22", value: "game9" },
      ],
      players: [
        {
          name: "BigMike",
          chips: 1100,
          game1: 5,
          game2: 2,
        },
        {
          name: "Foley",
          chips: 800,
          game1: 2,
          game2: 2,
        },
        {
          name: "Matthew",
          chips: 1000,
          game4: 3,
          game5: 4,
        },
        {
          name: "Anders",
          chips: 600,
        },
        {
          name: "Atom",
          chips: 600,
          game3: 2,
        },
        {
          name: "Ned",
          chips: 1500,
          game1: 4,
          game2: 3,
          game4: 2,
          game6: 4,
        },
        {
          name: "Christine",
          chips: 900,
          game3: 2,
          game4: 2,
          game6: 2,
        },
        {
          name: "Kat",
          chips: 1300,
          game2: 4,
          game3: 5,
        },
        {
          name: "David",
          chips: 1400,
          game2: 5,
          game5: 5,
        },
        {
          name: "Derik",
          chips: 300,
        },
        {
          name: "Miller",
          chips: 700,
          game1: 3,
        },
        {
          name: "Alex",
          chips: 700,
          game1: 2,
        },
        {
          name: "Evi",
          chips: 500,
        },
        {
          name: "Shane",
          chips: 1400,
          game3: 3,
          game4: 5,
          game6: 3,
        },
        {
          name: "Iustin",
          chips: 600,
        },
        {
          name: "Tim",
          chips: 400,
        },
        {
          name: "Chris",
          chips: 600,
          game3: 4,
        },
        {
          name: "Jim",
          chips: 400,
          game5: 2,
        },
        {
          name: "Ben",
          chips: 500,
          game5: 3,
        },
        {
          name: "Jess",
          chips: 1000,
          game4: 4,
          game6: 5,
        },
        {
          name: "Craig",
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
