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
        { text: "12/5", value: "game1" },
        { text: "12/12", value: "game2" },
        { text: "12/19", value: "game3" },
        { text: "12/26", value: "game4" },
        { text: "1/2", value: "game5" },
        { text: "1/9", value: "game6" },
        { text: "1/16", value: "game7" },
        { text: "1/23", value: "game8" },
      ],
      players: [
        {
          name: "BigMike",
          chips: 500,
          game1: 5,
        },
        {
          name: "Foley",
          chips: 200,
          game1: 2,
        },
        {
          name: "Matthew",
          chips: 100,
        },
        {
          name: "Anders",
          chips: 100,
        },
        {
          name: "Atom",
          chips: 100,
        },
        {
          name: "Ned",
          chips: 400,
          game1: 4,
        },
        {
          name: "Christine",
          chips: 100,
        },
        {
          name: "Kat",
          chips: 100,
        },
        {
          name: "David",
          chips: 100,
        },
        {
          name: "Derik",
          chips: 100,
        },
        {
          name: "Miller",
          chips: 300,
          game1: 3,
        },
        {
          name: "Alex",
          chips: 200,
          game1: 2,
        },
        {
          name: "Evi",
          chips: 100,
        },
        {
          name: "Shane",
          chips: 100,
        },
        {
          name: "Iustin",
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
