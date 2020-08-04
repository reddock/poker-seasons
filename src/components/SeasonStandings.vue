<template>
  <div>
    <v-content>
      <h3>August Online Season</h3>
      <v-container>
        <v-data-table
          dense
          hide-default-footer
          disable-pagination
          mobile-breakpoint="200"
          :headers="headers"
          :items="players"
          :sort-by="['total', 'name']"
          :sort-desc="['true']"
          class="elevation-1"
        ></v-data-table>
      </v-container>
      <v-container>
        <h3>Point System</h3>
        <v-row>
          <v-simple-table dense>
            <template v-slot:default>
              <thead>
                <tr>
                  <th class="text-left">Place</th>
                  <th class="text-left">Points</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="place in places" :key="place.name">
                  <td>{{ place.place }}</td>
                  <td>{{ place.points }}</td>
                </tr>
              </tbody>
            </template>
          </v-simple-table>
        </v-row>
      </v-container>
    </v-content>
  </div>
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
        {
          text: "Player",
          align: "start",
          sortable: false,
          value: "name",
        },
        { text: "Total", value: "total" },
        { text: "7/31", value: "game1" },
        { text: "8/3", value: "game2" },
        { text: "8/7", value: "game3" },
        { text: "8/10", value: "game4" },
        { text: "8/7", value: "game3" },
        { text: "8/10", value: "game4" },
        { text: "8/7", value: "game3" },
        { text: "8/10", value: "game4" },
      ],
      players: [
        {
          name: "BigMike",
          total: 2,
          game1: 1,
          game2: 1,
        },
        {
          name: "Alex",
          total: 9,
          game1: 5,
          game2: 4,
        },
        {
          name: "Kat",
          total: 5,
          game1: 4,
          game2: 1,
        },
        {
          name: "David",
          total: 4,
          game1: 3,
          game2: 1,
        },
        {
          name: "Anders",
          total: 5,
          game1: 2,
          game2: 3,
        },
        {
          name: "Shane",
          total: 2,
          game1: 1,
          game2: 1,
        },
        {
          name: "Christine",
          total: 2,
          game1: 1,
          game2: 1,
        },
        {
          name: "Iustin",
          total: 1,
          game1: 1,
        },
        {
          name: "Foley",
          total: 1,
          game1: 1,
        },
        {
          name: "Ned",
          total: 1,
          game1: 1,
        },
        {
          name: "Matthew",
          total: 1,
          game1: 1,
        },
        {
          name: "Atom",
          total: 1,
          game1: 1,
        },
        {
          name: "Derik",
          total: 1,
          game1: 1,
        },
        {
          name: "Jess",
          total: 5,
          game2: 5,
        },
      ],
    };
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
