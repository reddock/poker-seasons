<template>
  <v-card>
    <v-card-title>Blinds</v-card-title>
    <v-simple-table dense>
      <thead>
        <tr>
          <th class="text-left">Time</th>
          <th class="text-left">Small</th>
          <th class="text-left">Big</th>
          <th class="text-left">Duration</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="blind in blinds" :key="blind.small">
          <td>{{ blind.time }}</td>
          <td>{{ blind.small }}</td>
          <td>{{ blind.big }}</td>
          <td>{{ blind.duration }}</td>
        </tr>
      </tbody>
    </v-simple-table>
  </v-card>
</template>

<script>
export default {
  name: "Blinds",
  props: {
    msg: String,
  },
  data() {
    return {
      blinds: [
        {
          time: "7:30PM",
          small: 5,
          big: 10,
          duration: 15,
        },
        {
          time: "7:45PM",
          small: 10,
          big: 20,
          duration: 15,
        },
        {
          time: "8:00PM",
          small: 15,
          big: 30,
          duration: 15,
        },
        {
          time: "8:15PM",
          small: 20,
          big: 40,
          duration: 15,
        },
        {
          time: "8:30PM",
          small: 30,
          big: 60,
          duration: 15,
        },
        {
          time: "8:45PM",
          small: 50,
          big: 100,
          duration: 15,
        },
        {
          time: "9:00PM",
          small: 75,
          big: 150,
          duration: 15,
        },
        {
          time: "9:15PM",
          small: 100,
          big: 200,
          duration: 15,
        },
        {
          time: "9:30PM",
          small: 175,
          big: 350,
          duration: 15,
        },
        {
          time: "9:45PM",
          small: 250,
          big: 500,
          duration: 15,
        },
        {
          time: "10:00PM",
          small: 350,
          big: 700,
          duration: 15,
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
