<template>
  <v-app>
    <v-app-bar app color="black" dark>
      <v-toolbar-title>Mike's Poker Night!</v-toolbar-title>
    </v-app-bar>
    <v-main>
      <Dashboard />
    </v-main>
  </v-app>
</template>

<script>
import Dashboard from "./components/Dashboard";

export default {
  name: "App",

  components: {
    Dashboard,
  },

  data: () => ({
    //
  }),
};
</script>
