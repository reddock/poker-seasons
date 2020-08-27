<template>
  <v-card class="mx-auto">
    <v-card-title>August Online Season</v-card-title>
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
      places: [
        {
          place: "1st",
          points: 5,
        },
        {
          place: "2nd",
          points: 4,
        },
        {
          place: "3rd",
          points: 3,
        },
        {
          place: "In The Money",
          points: 2,
        },
        {
          place: "Attendance",
          points: 1,
        },
      ],
      headers: [
        { text: "Position", value: "position" },
        {
          text: "Player",
          align: "start",
          sortable: false,
          value: "name",
        },
        { text: "Total", value: "total" },
        { text: "Bye", value: "bye" },
        { text: "7/31", value: "game1" },
        { text: "8/3", value: "game2" },
        { text: "8/7", value: "game3" },
        { text: "8/10", value: "game4" },
        { text: "8/14", value: "game5" },
        { text: "8/17", value: "game6" },
        { text: "8/21", value: "game7" },
        { text: "8/24", value: "game8" },
        { text: "8/28", value: "game9" },
      ],
      players: [
        {
          name: "BigMike",
          total: 9,
          game1: 1,
          game2: 1,
          game3: 1,
          game4: 2,
          game5: 1,
          game6: 1,
          game7: 1,
          game8: 1,
        },
        {
          name: "Alex",
          total: 15,
          bye: 1,
          game1: 5,
          game2: 4,
          game3: 1,
          game4: 2,
          game5: 1,
          game6: 1,
        },
        {
          name: "Kat",
          total: 13,
          game1: 4,
          game2: 1,
          game3: 3,
          game4: 1,
          game5: 1,
          game6: 1,
          game7: 1,
          game8: 1,
        },
        {
          name: "David",
          total: 21,
          game1: 3,
          game2: 1,
          game3: 5,
          game4: 1,
          game5: 1,
          game6: 5,
          game7: 4,
          game8: 1,
        },
        {
          name: "Anders",
          total: 13,
          game1: 2,
          game2: 3,
          game3: 1,
          game4: 3,
          game5: 1,
          game6: 1,
          game7: 1,
          game8: 1,
        },
        {
          name: "Shane",
          total: 15,
          bye: 1,
          game1: 1,
          game2: 1,
          game4: 5,
          game5: 2,
          game6: 1,
          game7: 1,
          game8: 3,
        },
        {
          name: "Christine",
          total: 8,
          bye: 1,
          game1: 1,
          game2: 1,
          game3: 1,
          game4: 1,
          game5: 1,
          game6: 1,
          game8: 1,
        },
        {
          name: "Iustin",
          total: 5,
          bye: 1,
          game1: 1,
          game3: 1,
          game5: 1,
          game7: 1,
        },
        {
          name: "Foley",
          total: 8,
          bye: 1,
          game1: 1,
          game3: 1,
          game4: 1,
          game5: 1,
          game6: 1,
          game7: 1,
          game8: 1,
        },
        {
          name: "Ned",
          total: 11,
          bye: 1,
          game1: 1,
          game3: 1,
          game4: 1,
          game5: 1,
          game6: 2,
          game8: 4,
        },
        {
          name: "Matthew",
          total: 18,
          bye: 1,
          game1: 1,
          game3: 1,
          game4: 1,
          game5: 5,
          game6: 1,
          game7: 3,
          game8: 5,
        },
        {
          name: "Atom",
          total: 10,
          bye: 1,
          game1: 1,
          game5: 3,
          game6: 4,
          game7: 1,
        },
        {
          name: "Derik",
          total: 8,
          bye: 1,
          game1: 1,
          game3: 2,
          game5: 4,
        },
        {
          name: "Jess",
          total: 14,
          bye: 1,
          game2: 5,
          game4: 4,
          game6: 3,
          game8: 1,
        },
        {
          name: "Tim",
          total: 7,
          bye: 1,
          game3: 4,
          game4: 1,
          game5: 1,
        },
        {
          name: "Ben",
          total: 9,
          bye: 1,
          game3: 1,
          game5: 2,
          game7: 5,
        },
        {
          name: "Beaux",
          total: 2,
          bye: 1,
          game4: 1,
        },
        {
          name: "Miller",
          total: 2,
          bye: 1,
          game4: 1,
        },
      ],
    };
  },
  methods: {
    calcTotalInPlayers() {
      this.players.map((el) => {
        el.total = 0
        for (let key in el) {
          if (key.substring(0,4) === 'game' || key === 'bye') {
            el.total += el[key]
          }
        }
        return el
      })
      return this.players
    },
    addPositionInPlayers() {
      this.players.sort((a, b) => {
        if (b.total - a.total == 0) {
          return (b.name < a.name) ? 1 : -1
        }
        return b.total - a.total
      })
      this.players.map((el, index) => {
        if (index === 0) {
          el.position = '🥇'
        }
        else if (index === 1) {
          el.position = '🥈'
        }
        else if (index === 2) {
          el.position = '🥉'
        }
        else {
          el.position = index + 1
        }
      })
      return this.players
    }
  },
  created() {
    this.calcTotalInPlayers()
    this.addPositionInPlayers()
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
