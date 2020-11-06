<template>
  <div>
    <v-container>
      <v-row align="alignment" :justify="justify" class="ma-1 pa-1">
        <v-col>
          <v-tabs>
            <v-tab>November</v-tab>
            <v-tab>October</v-tab>
            <v-tab>September</v-tab>
            <v-tab-item>
              <v-card flat>
                <NovMerit />
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat>
                <OctMerit />
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card flat>
                <SeptMerit />
              </v-card>
            </v-tab-item>
          </v-tabs>
        </v-col>
      </v-row>
      <v-row :align="alignment" :justify="justify" class="ma-1 pa-1">
        <v-col sm="4">
          <PointSystem />
        </v-col>
        <v-col>
          <Blinds />
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import PointSystem from "./PointSystem";
import Blinds from "./Blinds";
import SeptMerit from "./SeptMerit";
import OctMerit from "./OctMerit";
import NovMerit from "./NovMerit";

export default {
  name: "Dashboard",
  props: {
    msg: String,
  },
  components: {
    SeptMerit,
    OctMerit,
    NovMerit,
    PointSystem,
    Blinds,
  },
  data() {
    return { months: ["November", "October", "September", "August"] };
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
