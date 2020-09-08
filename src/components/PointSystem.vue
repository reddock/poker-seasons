<template>
  <v-card class="mx-auto">
    <v-card-title>Point System</v-card-title>
    <v-simple-table dense>
      <thead>
        <tr>
          <th class="text-left">Place</th>
          <th class="text-left">Merit Points</th>
          <th class="text-left">Chips</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="place in places" :key="place.name">
          <td>{{ place.place }}</td>
          <td>{{ place.points }}</td>
          <td>{{ place.chips }}</td>
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
          place: "🥇 1st",
          points: 5,
          chips: 500,
        },
        {
          place: "🥈 2nd",
          points: 4,
          chips: 400,
        },
        {
          place: "🥉 3rd",
          points: 3,
          chips: 300,
        },
        {
          place: "In The Money",
          points: 2,
          chips: 200,
        },
        {
          place: "Attendance",
          points: 1,
          chips: 100,
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
