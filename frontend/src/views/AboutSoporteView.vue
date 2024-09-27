<template>
  <v-container>
    <v-row>
      <v-col class="about">
        <h1>Instalaciones</h1>
      </v-col>
    </v-row>
    <v-row>
      <instalations/>
    </v-row>
    
    

  </v-container>
</template>

<script>
import Instalations from '../components/InstalationsSoporte.vue'


export default {
  name: 'App',
  components: {
    Instalations
  },
  methods:{

  }
}
</script>

