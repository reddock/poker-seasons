<template>
  <v-card class="mx-auto" max-width="200">
    <v-card-title>Friday Aug 2nd</v-card-title>
    <v-simple-table dense>
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
    </v-simple-table>
  </v-card>
</template>

<script>
export default {
  name: "PointSystem",
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
