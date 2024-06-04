from tkinter import *
from PIL import Image, ImageTk
from pyswip import Prolog
import tkinter as tk

# Configuração do Prolog
prolog = Prolog()
prolog.consult("diagnostico_medico.pl")

class DiagnosticoApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Sistema de Diagnóstico Médico")
        self.root.configure(bg="#f0f0f0")

        # Janela principal
        self.frame_principal = Frame(root, bg="#f0f0f0")
        self.frame_principal.pack(fill=BOTH, expand=True, padx=20, pady=20)

        # Janela esquerda sintomas
        self.frame_sintomas = LabelFrame(self.frame_principal, text="Selecione os sintomas:", padx=5, pady=5, bg="#ffffff", font=("Italic", 14, "bold"))
        self.frame_sintomas.pack(side=LEFT, fill=BOTH)

        self.sintomas = [
            "aumento_do_figado", "calafrio", "cansaco_extremo", "choque", "coceira_nos_olhos", "congestao_nasal", 
            "conjuntivite", "coriza", "dificuldade_de_ingestao", "diminuicao_da_pressao_arterial", "dor_abdominal", 
            "dor_de_cabeca", "dor_de_cabeca_intensa", "dor_de_garganta", "dor_no_corpo", "dor_de_ouvido", "dor_no_peito",
            "dor_nos_olhos", "espirros", "erupcao_cutanea", "fadiga", "falencia_multipla_dos_orgaos", "febre", "febre_alta", "fraqueza", 
            "ictericia", "insuficiencia_hepatica", "insuficiencia_renal", "nausea", "perca_de_apetite", "perca_de_peso", "perda_de_paladar_ou_olfato", 
            "sangramento", "sangramento_grave", "secrecao_no_ouvido", "secrecao_nos_olhos", "suor_intenso", "tosse", "vomito", "vermelhidao_nos_olhos"
        ]
        # armazena valores booleano para cada sintoma.
        self.vars = {sintoma: BooleanVar() for sintoma in self.sintomas}

        # Divide a lista em duas colunas
        metade = len(self.sintomas) // 2 #  pega a quantidade de sintomas, divide por 2 e atribui na variavel metade
        sintomas1 = self.sintomas[:metade] 
        sintomas2 = self.sintomas[metade:]

        # Metade esquerda
        for i, sintoma in enumerate(sintomas1):
            Checkbutton(self.frame_sintomas, text=sintoma.replace('_', ' ').capitalize(), variable=self.vars[sintoma], bg="#ffffff", font=("Italic", 12)).grid(row=i, column=0, sticky='w')

        # Metade direita
        for i, sintoma in enumerate(sintomas2):
            Checkbutton(self.frame_sintomas, text=sintoma.replace('_', ' ').capitalize(), variable=self.vars[sintoma], bg="#ffffff", font=("Italic", 12)).grid(row=i, column=1, sticky='w')

        # Espaça entre os botões abixo das colunas
        self.frame_sintomas.grid_rowconfigure(len(sintomas1), minsize=30)

        # Posiciona os botões azuis lado a lado
        self.criar_botao_personalizado(self.frame_sintomas, text="Diagnosticar", command=self.diagnosticar, bg="#00008B", fg="white").grid(pady=16, padx=16, row=len(sintomas1) + 1, column=0)
        self.criar_botao_personalizado(self.frame_sintomas, text="Limpar Campos", command=self.limpar_campos, bg="#00008B", fg="white").grid(pady=16, padx=16, row=len(sintomas1) + 1, column=1)

        self.label_resultado = Label(self.frame_sintomas, text="", font=("Italic", 15), bg="#ffffff", fg="black")
        self.label_resultado.grid(pady=8, row=len(sintomas1) + 2, column=0, columnspan=2)

        # Janela direita imagem
        self.frame_imagem = Frame(self.frame_principal, padx=20, pady=20, bg="#f0f0f0")
        self.frame_imagem.pack(side=RIGHT, fill=BOTH)

        self.carregar_imagem()

    def criar_botao_personalizado(self, parent, text, command, bg, fg):
        # Cria um botão personalizado
        btn = Button(parent, text=text, command=command, bg=bg, fg=fg, font=("Helvetica", 16, "italic"), relief="groove", bd=2, padx=10, pady=5)
        return btn

    def carregar_imagem(self):
        # Carrega a imagem
        imagem = Image.open("medico.JPEG")
        self.imagem_tk = ImageTk.PhotoImage(imagem)

        # Exibe a imagem
        self.label_imagem = Label(self.frame_imagem, image=self.imagem_tk, bg="#f0f0f0")
        self.label_imagem.pack(pady=10, anchor=CENTER)

    def diagnosticar(self):
        for sintoma, var in self.vars.items():
            if var.get():
                prolog.assertz(f"sintomas({sintoma})")

        diagnostico = list(prolog.query("diagnosticar(Doenca)"))[0]['Doenca']
        self.label_resultado.config(text=f"\nResultado:\n {diagnostico}\n\n\nLembre-se sempre de consultar com um profissional.")

        # Limpa os campos selecionados
        for sintoma in self.sintomas:
            prolog.retractall(f"sintomas({sintoma})")

    # Limpa o resultado do diagnostico
    def limpar_campos(self):
        for var in self.vars.values():
            var.set(False)
        self.label_resultado.config(text="")

# Cria a janela e inicia o loop principal
if __name__ == "__main__":
    root = Tk()
    app = DiagnosticoApp(root)
    root.mainloop()
