<template>
  <v-container grid-list-xs>
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

            <v-icon small @click="showHistoryFor(item)"> mdi-book-clock </v-icon>

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
                <v-col cols="12">
                  <v-select
                    v-model="editedItem.status"
                    :items="itemsStatus"
                    label="Status"
                  ></v-select>
                </v-col>
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
          >Historial test</v-card-title
        >

        <v-row>
          <v-col>
            <v-data-table
              :headers="headershistorial"
              :items="historydata"
              class="elevation-1"
            >
              <template v-slot:top>
                <v-toolbar flat>
                  <v-toolbar-title>Mis instalaciones</v-toolbar-title>         
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
      headershistorial: [],
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
    this.headershistorial = Historial.data().headers;
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