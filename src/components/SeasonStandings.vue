<template>
  <div class="hello">
    <h3>
      August Regular Tournament Season MIKE
    </h3>
    <p></p>
    <v-data-table
      dense
      hide-default-footer
      disable-pagination
      :headers="headers"
      :items="players"
      :sort-by="['total', 'name']"
      :sort-desc="['true']"
      class="elevation-1"
    ></v-data-table>
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
        { text: "8/14", value: "game5" },
        { text: "8/17", value: "game6" },
        { text: "8/21", value: "game7" },
        { text: "8/24", value: "game8" },
        { text: "8/28", value: "game9" },
      ],
      players: [
        {
          name: "BigMike",
          total: 1,
          game1: 1,
        },
        {
          name: "Alex",
          total: 5,
          game1: 5,
        },
        {
          name: "Kat",
          total: 4,
          game1: 4,
        },
        {
          name: "David",
          total: 3,
          game1: 3,
        },
        {
          name: "Anders",
          total: 2,
          game1: 2,
        },
        {
          name: "Shane",
          total: 1,
          game1: 1,
        },
        {
          name: "Christine",
          total: 1,
          game1: 1,
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
