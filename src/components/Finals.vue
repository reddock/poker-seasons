<template>
  <v-card>
    <v-card-title>Finals Winners</v-card-title>
    <v-simple-table dense>
      <thead>
        <tr>
          <th class="text-left">Place</th>
          <th class="text-left">Name</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="result in results" :key="result.place">
          <td>{{ result.place }}</td>
          <td>{{ result.name }}</td>
        </tr>
      </tbody>
    </v-simple-table>
  </v-card>
</template>

<script>
export default {
  name: "Finals",
  props: {
    msg: String,
  },
  data() {
    return {
      results: [
        {
          place: "1st",
          name: "Atom",
        },
        {
          place: "2nd",
          name: "Matthew",
        },
        {
          place: "3rd",
          name: "David",
        },
        {
          place: "4th",
          name: "Christine",
        },
        {
          place: "5th",
          name: "Shane",
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
