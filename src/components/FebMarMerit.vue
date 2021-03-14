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
        { text: "2/22", value: "game8" },
        { text: "2/26", value: "game9" },
        { text: "3/1", value: "game10" },
        { text: "3/5", value: "game11" },
        { text: "3/7", value: "game12" },
        { text: "3/8", value: "game13" },
        { text: "3/12", value: "game14" },
      ],
      players: [
        {
          name: "BigMike",
          chips: 3200,
          game1: 3,
          game2: 2,
          game4: 2,
          game5: 3,
          game6: 5,
          game7: 2,
          game11: 5,
          game12: 3,
          game14: 2,
        },
        {
          name: "Foley",
          chips: 1500,
          game9: 3,
          game14: 3,
        },
        {
          name: "Matthew",
          chips: 1400,
          game3: 3,
          game13: 4,
        },
        {
          name: "Anders",
          chips: 2800,
          game4: 5,
          game5: 2,
          game6: 4,
          game8: 5,
          game9: 2,
          game12: 2,
        },
        {
          name: "Christine",
          chips: 2100,
          game1: 5,
          game10: 4,
        },
        {
          name: "Ben",
          chips: 700,
          game9: 5,
        },
        {
          name: "Kat",
          chips: 1600,
          game8: 4,
        },
        {
          name: "Alex",
          chips: 2900,
          game2: 3,
          game4: 3,
          game5: 4,
          game7: 5,
          game14: 5,
        },
        {
          name: "Shane",
          chips: 1800,
          game1: 4,
          game3: 5,
        },
        {
          name: "Chris",
          chips: 2000,
          game2: 4,
          game10: 5,
          game11: 2,
          game12: 4,
          game13: 2,
        },
        {
          name: "Iustin",
          chips: 900,
          game2: 5,
        },
        { 
          name: "Alejandro",
          chips: 200,
        },
        { 
          name: "Jim",
          chips: 400,
        },
        { 
          name: "Miller",
          chips: 1800,
          game4: 4,
          game9: 4,
          game10: 2,
          game11: 3,
        },
        { 
          name: "Brito",
          chips: 1300,
          game8: 3,
          game13: 5,
        },
        { 
          name: "Derik",
          chips: 500,
        },
        { 
          name: "David",
          chips: 2100,
          game7: 4,
          game10: 3,
          game14: 4,
        },
        { 
          name: "Jess",
          chips: 1700,
          game3: 4,
          game5: 5,
          game13: 3,
        },
        { 
          name: "Alex T",
          chips: 200,
        },
        { 
          name: "Kevin",
          chips: 300,
        },
        { 
          name: "Ned",
          chips: 700,
        },
        { 
          name: "Nancy",
          chips: 900,
          game7: 3,
        },
        { 
          name: "Atom",
          chips: 1700,
          game11: 4,
          game12: 5,
        },
        { 
          name: "Sherry",
          chips: 100,
        },
        { 
          name: "Russell",
          chips: 100,
        },
        { 
          name: "Christian",
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
