<template>
  <v-app>
    <v-app-bar app color="black" dark>
      <v-toolbar-title>Mike's Poker Night!</v-toolbar-title>
    </v-app-bar>

    <SeasonStandings />
  </v-app>
</template>

<script>
import SeasonStandings from "./components/SeasonStandings";

export default {
  name: "App",

  components: {
    SeasonStandings,
  },

  data: () => ({
    //
  }),
};
</script>
