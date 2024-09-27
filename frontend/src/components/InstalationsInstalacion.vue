<template>
  <v-container grid-list-xs>
    <div class="text-center" data-app>
      <v-dialog v-model="dialog" width="500">        
        <v-card>
          <v-card-title class="text-h5 grey lighten-2">
            Nueva Instalacion
          </v-card-title>
          <v-card-text>
            <v-form>
              <v-row>
                <v-col class="my-2" cols="12">
                  <v-text-field
                    v-model="newInstalacion.clientid"
                    :counter="10"
                    label="Client Id"
                    required
                  ></v-text-field>
                  <v-text-field
                    v-model="newInstalacion.tecnicoid"
                    :counter="10"
                    label="Tecnicoid"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12" class="my-n2">
                  <h3 class="mb-2">Fecha</h3>
                  <v-date-picker v-model="newInstalacion.date"></v-date-picker>
                </v-col>
                <v-col cols="12">
                  <v-text-field
                    v-model="newInstalacion.position"
                    :counter="50"
                    label="Position"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-select
                    v-model="newInstalacion.tipo"
                    :items="itemsTipo"
                    label="Tipo"
                  ></v-select>
                  <div v-if="newInstalacion.tipo == 'coordinador'">
                    <v-text-field
                      v-model="newInstalacion.tipoPlaca"
                      :counter="10"
                      label="TipoPlaca"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.firmware"
                      :counter="10"
                      label="Firmware"
                      required
                    ></v-text-field>
                  </div>
                  <div v-if="newInstalacion.tipo == 'meteorologica'">
                    <v-text-field
                      v-model="newInstalacion.tipoPlaca"
                      :counter="10"
                      label="TipoPlaca"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.firmware"
                      :counter="10"
                      label="Firmware"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.compania3G"
                      :counter="10"
                      label="Compania3G"
                      required
                    ></v-text-field>
                  </div>                  
                  <div v-if="newInstalacion.tipo == 'sonda'">
                    <v-text-field
                      v-model="newInstalacion.tipoPlaca"
                      :counter="10"
                      label="TipoPlaca"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.largoSonda"
                      :counter="10"
                      label="LargoSonda"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.companiaComunicacion"
                      :counter="10"
                      label="CompaniaComunicacion"
                      required
                    ></v-text-field> 
                  </div>
                  <div v-if="newInstalacion.tipo == 'canales'">
                    <v-text-field
                      v-model="newInstalacion.tipoPlaca"
                      :counter="10"
                      label="TipoPlaca"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.firmware"
                      :counter="10"
                      label="Firmware"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.alturaMaxima"
                      :counter="10"
                      label="alturaMaxima"
                      required
                    ></v-text-field> 
                    <v-text-field
                      v-model="newInstalacion.alturaSensor"
                      :counter="10"
                      label="alturaSensor"
                      required
                    ></v-text-field> 
                    <v-text-field
                      v-model="newInstalacion.alturaAgua"
                      :counter="10"
                      label="alturaAgua"
                      required
                    ></v-text-field> 
                  </div>
                  <div v-if="newInstalacion.tipo == 'pozos'">
                    <v-text-field
                      v-model="newInstalacion.tipoPlaca"
                      :counter="10"
                      label="TipoPlaca"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.firmware"
                      :counter="10"
                      label="Firmware"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.profundidadPozo"
                      :counter="10"
                      label="ProfundidadPozo"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.nivelEstatico"
                      :counter="10"
                      label="nivelEstatico"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.nivelDinamico"
                      :counter="10"
                      label="nivelDinamico"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.distanciaSensor"
                      :counter="10"
                      label="distanciaSensor"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="newInstalacion.factorPulsos"
                      :counter="10"
                      label="factorPulsos"
                      required
                    ></v-text-field>
                    <input type="checkbox" id="tresG" v-model="newInstalacion.tresG">
                    <label for="checkbox">{{ checked }}  Tiene 3G  </label>
                    <v-text-field
                      v-model="newInstalacion.tipoEnergia"
                      :counter="10"
                      label="tipoEnergia"
                      required
                    ></v-text-field>
                  </div>
                </v-col>
              </v-row>
            </v-form>
          </v-card-text>

          <v-divider></v-divider>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="primary" text @click="addInstalacion">
              Añadir Instalación
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </div>
    <br />
    <v-row>
      <v-col>
        <v-data-table
          :headers="headers"
          :items="instalaciones"
          class="elevation-1"
        >
          <template v-slot:top>
            <v-toolbar flat>
              <v-toolbar-title>Mis instalaciones</v-toolbar-title>
              <v-divider class="mx-4" inset vertical></v-divider>
              <v-spacer></v-spacer>
                  <v-btn
                    color="primary"
                    dark
                    class="mb-2"
                    @click="dialog=true"
                  >
                    Nueva instalacion
                  </v-btn>              
            </v-toolbar>
          </template>
          <template v-slot:[`item.actions`]="{ item }">
            <v-btn color="blue darken-1" text @click="getItem(item)"
            >ver más</v-btn
          > 
            <v-icon small class="mr-2" @click="editItem(item)">
              mdi-pencil
            </v-icon>
            <v-icon small class="mr-2" @click="deleteItem(item)"> mdi-delete </v-icon>
          </template>
        </v-data-table>
      </v-col>
    </v-row>
    
    <v-dialog v-model="readDialog" max-width="500px">
      <v-card>
        <v-card-title>
          <span class="text-h5">{{ "Información adicional" }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
                <v-col class="my-2" cols="12"> 
                  <template v-for="(item,index) in readItem" >
                    <li v-if="item!=null" :key="index"  class="text-left align-self-start">
                      <b>{{index}} :</b>  {{item}}
                    </li>
                   </template>
                </v-col>
            </v-row>
          </v-container>
        </v-card-text>
      </v-card>
    </v-dialog>

    <v-dialog v-model="readHistoryDialog" max-width="400px">
      <v-card>
        <v-card-title>
          <span class="text-h5">{{ "Detalles del historial" }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
                <v-col class="my-2" cols="12"> 
                  <template v-for="(item,index) in historyItem" >
                    <li v-if="item!=null" :key="index"  class="text-left align-self-start">
                      <b>{{index}} :</b>  {{item}}
                    </li>
                   </template>
                </v-col>
            </v-row>
          </v-container>
        </v-card-text>
      </v-card>
    </v-dialog>

    <v-dialog v-model="editdialog" max-width="500px">
      <v-card>
        <v-card-title>
          <span class="text-h5">{{ formTitle }}</span>
        </v-card-title>

        <v-card-text>
          <v-container>
            <v-form>
              <v-row>
                <v-col class="my-2" cols="12">
                  <v-text-field
                    v-model="editedItem.clientid"
                    :counter="10"
                    label="Client Id"
                    required
                  ></v-text-field>
                  <v-text-field
                    v-model="editedItem.tecnicoid"
                    :counter="10"
                    label="Tecnicoid"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12" class="my-n2">
                  <h3 class="mb-2">Fecha</h3>
                  <v-date-picker v-model="editedItem.date"></v-date-picker>
                </v-col>
                <v-col cols="12">
                  <v-text-field
                    v-model="editedItem.position"
                    :counter="50"
                    label="Position"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12">

                  <div style="text-align:left">
                    <h3><b>Tipo: </b>{{editedItem.tipo}} </h3>
                  </div>
                  <div v-if="editedItem.tipo == 'coordinador'">
                    <v-text-field
                      v-model="editedItem.tipoPlaca"
                      :counter="10"
                      label="TipoPlaca"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.firmware"
                      :counter="10"
                      label="Firmware"
                      required
                    ></v-text-field>
                  </div>
                  <div v-if="editedItem.tipo == 'meteorologica'">
                    <v-text-field
                      v-model="editedItem.tipoPlaca"
                      :counter="10"
                      label="TipoPlaca"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.firmware"
                      :counter="10"
                      label="Firmware"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.compania3G"
                      :counter="10"
                      label="Compania3G"
                      required
                    ></v-text-field>
                  </div>                  
                  <div v-if="editedItem.tipo == 'sonda'">
                    <v-text-field
                      v-model="editedItem.tipoPlaca"
                      :counter="10"
                      label="TipoPlaca"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.largoSonda"
                      :counter="10"
                      label="LargoSonda"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.companiaComunicacion"
                      :counter="10"
                      label="CompaniaComunicacion"
                      required
                    ></v-text-field> 
                  </div>
                  <div v-if="editedItem.tipo == 'canales'">
                    <v-text-field
                      v-model="editedItem.tipoPlaca"
                      :counter="10"
                      label="TipoPlaca"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.firmware"
                      :counter="10"
                      label="Firmware"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.alturaMaxima"
                      :counter="10"
                      label="alturaMaxima"
                      required
                    ></v-text-field> 
                    <v-text-field
                      v-model="editedItem.alturaSensor"
                      :counter="10"
                      label="alturaSensor"
                      required
                    ></v-text-field> 
                    <v-text-field
                      v-model="editedItem.alturaAgua"
                      :counter="10"
                      label="alturaAgua"
                      required
                    ></v-text-field> 
                  </div>
                  <div v-if="editedItem.tipo == 'pozos'">
                    <v-text-field
                      v-model="editedItem.tipoPlaca"
                      :counter="10"
                      label="TipoPlaca"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.firmware"
                      :counter="10"
                      label="Firmware"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.profundidadPozo"
                      :counter="10"
                      label="ProfundidadPozo"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.nivelEstatico"
                      :counter="10"
                      label="nivelEstatico"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.nivelDinamico"
                      :counter="10"
                      label="nivelDinamico"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.distanciaSensor"
                      :counter="10"
                      label="distanciaSensor"
                      required
                    ></v-text-field>
                    <v-text-field
                      v-model="editedItem.factorPulsos"
                      :counter="10"
                      label="factorPulsos"
                      required
                    ></v-text-field>
                    <input type="checkbox" id="tresG" v-model="editedItem.tresG">
                    <label for="checkbox">{{ checked }}  Tiene 3G  </label>
                    <v-text-field
                      v-model="editedItem.tipoEnergia"
                      :counter="10"
                      label="tipoEnergia"
                      required
                    ></v-text-field>
                  </div>
                </v-col>
              </v-row>
            </v-form>
          </v-container>
        </v-card-text>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="close">
            Cancel
          </v-btn>
          <v-btn color="blue darken-1" text @click="editarInstalacion">
            Editar
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <v-dialog v-model="dialogDelete" max-width="500px">
      <v-card>
        <v-card-title class="text-h5"
          >Estás seguro de eliminar esta instalación</v-card-title
        >
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="closeDelete"
            >Cancelar</v-btn
          >
          <v-btn color="blue darken-1" text @click="deleteItemConfirm"
            >OK</v-btn
          >
          <v-spacer></v-spacer>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <v-dialog v-model="dialogHistory" max-width="1000px">
      <v-card>
        <v-card-title class="text-h5"
          >Historial</v-card-title
        >

        <v-row>
          <v-col>
            <v-data-table
              :headers="headershistorialwoutActions"
              :items="historydata"
              class="elevation-1"
            >
              <template v-slot:top>
                <v-toolbar flat>
                  <v-toolbar-title>Historial vinculado instalacion</v-toolbar-title>
                  <v-divider class="mx-4" inset vertical></v-divider>
                  <v-spacer></v-spacer>              
                </v-toolbar>
              </template>
              <template v-slot:[`item.actions`]="{ item }">
            <v-btn color="blue darken-1" text @click="getDetail(item)"
            >ver más</v-btn
          > </template>

            </v-data-table>
          </v-col>
        </v-row>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="closeHistory"
            >Cerrar</v-btn
          >
          <v-spacer></v-spacer>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
import axios from "axios";
import Historial from '../components/Historial.vue'

export default {
  name: "Instalations",
  data() {
    return {
      instalaciones: [],
      dialog: false,
      editdialog:false,
      readDialog:false,
      readHistoryDialog:false,
      newInstalacion: {
        clientid: 0,
        date: "",
        position: "",
        status: "Revisando",
        tipo:"coordinador",
        tecnicoid: 1,
      },
      itemsTipo: ["coordinador", "meteorologica", "sonda","canales","pozos","otro"],
      itemsStatus: ["Revisando", "Verificada"],
      dialogDelete: false,
      dialogHistory: false,
      headers: [
        {
          text: "Client Id",
          align: "start",
          sortable: false,
          value: "clientid",
        },
        { text: "Date", value: "date" },
        { text: "Position", value: "position" },
        { text: "Status", value: "status" },
        { text: "Tecnicoid", value: "tecnicoid" },
        { text: "Tipo", value: "tipo" },
        { text: "Actions", value: "actions", sortable: false },
      ],
      editedIndex: -1,
      editedItem: {
        clientid: 0,
        date: "",
        position: "",
        tipo: "coordinador",
        status: "Revisando",
        tecnicoid: 1,
      },
      readItem: {
      },
      historyItem: {},
      defaultItem: {
        clientid: 0,
        date: "",
        position: "",
        tipo: "coordinador",
        status: "Revisando",
        tecnicoid: 1,
      },
      headershistorialwoutActions: [],
      historydata: [],
    };
  },
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "New Item" : "Edit Item";
    },
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
    dialogHistory(val) {
      val || this.closeHistory();
    },
  },
  created() {
    this.getInstalaciones();
    this.headershistorialwoutActions = Historial.data().headers;
  },
  methods: {
    getInstalaciones() {
      console.log("buscar instalaciones");
      axios.get("http://localhost:80/instalation/all").then((res) => {
        console.log("instalaciones", res.data);
        this.instalaciones = res.data;
      });
    },
    getItem(item) {
      console.log("buscar instalacion");
      axios.get("http://localhost:80/instalation/"+item.id+"/tipo/"+item.tipo).then((res) => {
        console.log("instalacion", res.data);
        this.readItem = res.data[0];
        this.readDialog=true;
      });      
    },

    getDetail(item){
  
      console.log("buscando detalles",item.id);
      axios.get("http://localhost:80/history/detalles/"+item.id).then((res) =>{
        console.log("historial", res);
        this.historyItem = res.data;
        this.readHistoryDialog=true;
      });  
    },

    addInstalacion() {
      console.log("Añadir instalacion");
      this.dialog = false;
      console.log(this.newInstalacion);
      let formData = {
        clientid: parseInt(this.newInstalacion.clientid),
        tecnicoid: parseInt(this.newInstalacion.tecnicoid),
        date: this.newInstalacion.date,
        position: this.newInstalacion.position,
        status: this.newInstalacion.status,
        tipo: this.newInstalacion.tipo,
        tipoPlaca: this.newInstalacion.tipoPlaca,
        firmware: this.newInstalacion.firmware,
        compania3G: this.newInstalacion.compania3G,
        largoSonda: parseFloat(this.newInstalacion.largoSonda),
        companiaComunicacion: this.newInstalacion.companiaComunicacion,
        alturaMaxima: parseFloat(this.newInstalacion.alturaMaxima),
        alturaSensor: parseFloat(this.newInstalacion.alturaSensor),
        alturaAgua: parseFloat(this.newInstalacion.alturaAgua),
        profundidadPozo: parseFloat(this.newInstalacion.profundidadPozo),
        nivelEstatico: parseFloat(this.newInstalacion.nivelEstatico),
        nivelDinamico: parseFloat(this.newInstalacion.nivelDinamico),
        distanciaSensor: parseFloat(this.newInstalacion.distanciaSensor),
        factorPulsos: parseFloat(this.newInstalacion.factorPulsos),
        tresG: this.newInstalacion.tresG,
        tipoEnergia: this.newInstalacion.tipoEnergia,
      };


      axios
        .post("http://localhost:80/instalation/add", formData)
        .then((res) => {
          console.log("resultado de post", res);

          // Actualizar historial
          formData['installid'] = res["data"]['installid'];
          formData['action'] = "Created";
          axios
            .post("http://localhost:80/history/add", formData)
            .then((resultado) => {
              console.log("ressss", resultado)
            })
            .catch((err) => {
              console.log(err);
            });
          this.getInstalaciones();

        })
        .catch((err) => {
          console.log(err);
        });

    },
    editItem(item) {
      this.editedIndex = this.instalaciones.indexOf(item);
      this.editedItem = Object.assign({}, item);
      axios.get("http://localhost:80/instalation/"+item.id+"/tipo/"+item.tipo).then((res) => {
        console.log("instalacion", res.data);
        this.editedItem = res.data[0];
        this.editdialog = true;
      }); 
    },

    deleteItem(item) {
      this.editedIndex = this.instalaciones.indexOf(item);
      this.editedItem = Object.assign({}, item);
      console.log(this.editedItem);
      this.dialogDelete = true;
    },

    showHistoryFor(item) {
      // Funcion para mostrar el historial de una instalacion en especifico.

      this.editedIndex = this.instalaciones.indexOf(item);
      this.editedItem = Object.assign({}, item);
      console.log("Obteniendo historial.")
      Historial.methods.getInstalacion(this.editedItem.id).then(ok => {
        this.historydata = ok;
        console.log(ok);
      });
      this.dialogHistory = true;
    },

    deleteItemConfirm() {
      // Funcion para eliminar item de la lista y la BD.

      let id_back = this.editedItem.id; // Para guardar la id del item despues de ser borrado el objeto que lo contenia.
      axios
        .delete("http://localhost:80/instalation/"+this.editedItem.id)
        .then((res) => {
          console.log("resultado de post", res);
          let formData = {
            clientid: 0,
            tecnicoid: 0,
            date: "",
            position: "",
            status: "",
            tipo: "",
          };
          console.log(id_back);
          formData['installid'] = id_back;
          formData['action'] = "Deleted";
          axios
            .post("http://localhost:80/history/add", formData)
            .then((resultado) => {
              console.log("ressss", resultado)
            })
            .catch((err) => {
              console.log(err);
            }); 
                    
          this.getInstalaciones();

        })
        .catch((err) => {
          console.log(err);
        });
        this.closeDelete();
    },

    close() {
      this.editdialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeHistory() {
      // Accion al cerrar ventana Historial

      // "Limpiar" variables relacionadas
      this.dialogHistory = false;
      this.historydata = []; 
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    editarInstalacion(){
      this.editdialog=false
      axios
        .put("http://localhost:80/instalation/"+this.editedItem.id,this.editedItem)
        .then((res) => {
          console.log("resultado de put", res);
          this.editedItem['installid'] = this.editedItem.id;
          this.editedItem['action'] = "Modified";

          // Si se modifica una instalacion se crea una entrada en la BD con los datos modificados  
          axios
            .post("http://localhost:80/history/add", this.editedItem)
            .then((resultado) => {
              console.log("ressss", resultado)
            })
            .catch((err) => {
              console.log(err);
            });
          this.getInstalaciones();

        })
        .catch((err) => {
          console.log(err);
        });        
    }
  },
};
</script>

<style>
</style>