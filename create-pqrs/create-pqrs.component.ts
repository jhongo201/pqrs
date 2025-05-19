// create-pqrs.component.ts
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { PqrsService } from '../../../core/services/pqrs.service';

interface Tema {
  idTema: number;
  nombre: string;
  area: {
    nombre: string;
  };
}

@Component({
  selector: 'app-create-pqrs',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './create-pqrs.component.html',
  styleUrls: ['./create-pqrs.component.css']  // Actualizado
})
export class CreatePqrsComponent implements OnInit {
  pqrsForm: FormGroup;
  temas: Tema[] = [];
  isLoading = false;
  error = '';
  archivoSeleccionado: File | null = null;
  tiposDocumento = ['CC', 'CE', 'PA', 'NIT'];
  prioridades = ['BAJA', 'MEDIA', 'ALTA'];

  constructor(
    private fb: FormBuilder,
    private pqrsService: PqrsService,
    public router: Router
  ) {
    this.pqrsForm = this.fb.group({
      idTema: ['', Validators.required],
      nombreSolicitante: ['', Validators.required],
      emailSolicitante: ['', [Validators.required, Validators.email]],
      telefonoSolicitante: ['', Validators.required],
      tipoDocumentoSolicitante: ['CC', Validators.required],
      numeroDocumentoSolicitante: ['', Validators.required],
      titulo: ['', Validators.required],
      descripcion: ['', Validators.required],
      prioridad: ['MEDIA', Validators.required]
    });
  }

  ngOnInit() {
    this.cargarTemas();
  }

  cargarTemas() {
    this.pqrsService.listarTemas().subscribe({
      next: (data) => {
        this.temas = data;
      },
      error: (error) => {
        this.error = 'Error al cargar los temas';
        console.error('Error:', error);
      }
    });
  }

  onFileChange(event: Event) {
    const file = (event.target as HTMLInputElement).files?.[0];
    if (file) {
      this.archivoSeleccionado = file;
    }
  }

  async onSubmit() {
    if (this.pqrsForm.valid) {
      this.isLoading = true;
      this.error = '';

      let formData = this.pqrsForm.value;

      // Si hay un archivo seleccionado, convertirlo a Base64
      if (this.archivoSeleccionado) {
        try {
          const base64 = await this.convertirArchivoABase64(this.archivoSeleccionado);
          formData = { ...formData, archivoAdjunto: base64 };
        } catch (error) {
          this.error = 'Error al procesar el archivo adjunto';
          this.isLoading = false;
          return;
        }
      }

      this.pqrsService.crearPQRS(formData).subscribe({
        next: (response) => {
          this.isLoading = false;
          this.router.navigate(['/pqrs'], { 
            queryParams: { creado: 'success' } 
          });
        },
        error: (error) => {
          this.isLoading = false;
          this.error = 'Error al crear la PQRS';
          console.error('Error:', error);
        }
      });
    } else {
      this.error = 'Por favor, complete todos los campos requeridos';
    }
  }

  private convertirArchivoABase64(file: File): Promise<string> {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => {
        if (typeof reader.result === 'string') {
          resolve(reader.result.split(',')[1]);
        } else {
          reject('Error al convertir archivo');
        }
      };
      reader.onerror = (error) => reject(error);
    });
  }

  // Método auxiliar para navegar
  volver() {
    this.router.navigate(['/pqrs']);
  }
}