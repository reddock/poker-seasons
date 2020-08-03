<template>
  <v-app>
    <v-app-bar app color="red" dark>
      <v-btn href="http://mikespokernight.com" target="_blank" text>
        <span class="mr-2">Mike's Poker Night</span>
      </v-btn>
    </v-app-bar>

    <v-main>
      <SeasonStandings />
    </v-main>
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
