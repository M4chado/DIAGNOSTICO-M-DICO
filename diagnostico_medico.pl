% Sintomas
sintoma(febre).
sintoma(febre_alta).
sintoma(tosse).
sintoma(dor_de_garganta).
sintoma(dor_de_cabeca).
sintoma(dor_de_cabeca_intensa).
sintoma(dor_no_corpo).
sintoma(dor_abdominal).
sintoma(dor_de_ouvido).
sintoma(fadiga).
sintoma(nausea).
sintoma(vomito).
sintoma(erupcao_cutanea).
sintoma(conjuntivite).
sintoma(perda_de_paladar_ou_olfato).
sintoma(congestao_nasal).
sintoma(espirros).
sintoma(calafrio).
sintoma(coriza).
sintoma(secrecao_no_ouvido).
sintoma(coceira_nos_olhos).
sintoma(dor_nos_olhos).
sintoma(dificuldade_de_injestao).
sintoma(sangramento).
sintoma(sangramento_grave).
sintoma(diminuicao_da_pressao_arterial).
sintoma(aumento_do_figado).
sintoma(choque).
sintoma(fraqueza).
sintoma(ictericia).
sintoma(insuficiencia_hepatica).
sintoma(insuficiencia_renal).
sintoma(falencia_multipla_dos_orgaos).
sintoma(perca_de_peso).
sintoma(suor_intenso).
sintoma(perca_de_apetite).
sintoma(cansaco_extremo).
sintoma(dor_no_peito).
sintoma(secrecao_nos_olhos).
sintoma(vermelhidao_nos_olhos).

% Relacionamentos
diagnostico(gripe) :-
    tem_sintoma(febre),
    tem_sintoma(tosse),
    tem_sintoma(dor_de_garganta),
    tem_sintoma(dor_de_cabeca),
    tem_sintoma(dor_no_corpo).

diagnostico(covid_19) :-
    tem_sintoma(febre),
    tem_sintoma(tosse),
    tem_sintoma(dor_de_garganta),
    tem_sintoma(dor_de_cabeca),
    tem_sintoma(fadiga),
    tem_sintoma(perda_de_paladar_ou_olfato).

diagnostico(dengue) :-
    tem_sintoma(febre_alta),
    tem_sintoma(dor_de_cabeca_intensa),
    tem_sintoma(dor_nos_olhos),
    tem_sintoma(dor_no_corpo),
    tem_sintoma(cansaco_extremo),
    tem_sintoma(nausea),
    tem_sintoma(vomito),
    tem_sintoma(erupcao_cutanea),
    tem_sintoma(sangramento).

diagnostico(intoxicacao_alimentar) :-
    tem_sintoma(nausea),
    tem_sintoma(vomito),
    tem_sintoma(dor_abdominal),
    tem_sintoma(febre).

diagnostico(sarampo) :-
    tem_sintoma(febre),
    tem_sintoma(erupcao_cutanea),
    tem_sintoma(tosse),
    tem_sintoma(dor_de_garganta),
    tem_sintoma(conjuntivite).

diagnostico(resfriado) :-
    tem_sintoma(congestao_nasal),
    tem_sintoma(espirros),
    tem_sintoma(dor_de_garganta).

diagnostico(gastrite) :-
    tem_sintoma(dor_abdominal),
    tem_sintoma(nausea),
    tem_sintoma(vomito).

diagnostico(amigdalite) :-
    tem_sintoma(dor_de_garganta),
    tem_sintoma(febre),
    tem_sintoma(dificuldade_de_ingestao).

diagnostico(conjuntivite) :-
    tem_sintoma(vermelhidao_nos_olhos),
    tem_sintoma(coceira_nos_olhos),
    tem_sintoma(secrecao_nos_olhos).

diagnostico(otite) :-
    tem_sintoma(dor_de_ouvido),
    tem_sintoma(febre),
    tem_sintoma(secrecao_no_ouvido).

diagnostico(dengue_hemorragica) :-
    tem_sintoma(febre_alta),
    tem_sintoma(dor_de_cabeca_intensa),
    tem_sintoma(dor_nos_olhos),
    tem_sintoma(dor_no_corpo),
    tem_sintoma(sangramento_grave),
    tem_sintoma(diminuicao_da_pressao_arterial),
    tem_sintoma(aumento_do_figado),
    tem_sintoma(choque).

diagnostico(chikungunya) :-
    tem_sintoma(febre_alta),
    tem_sintoma(dor_no_corpo),
    tem_sintoma(dor_de_cabeca),
    tem_sintoma(erupcao_cutanea),
    tem_sintoma(fadiga),
    tem_sintoma(nausea),
    tem_sintoma(vomito).

diagnostico(zika) :-
    tem_sintoma(febre),
    tem_sintoma(erupcao_cutanea),
    tem_sintoma(dor_no_corpo),
    tem_sintoma(conjuntivite),
    tem_sintoma(dor_de_cabeca),
    tem_sintoma(fadiga).

diagnostico(febre_amarela) :-
    tem_sintoma(febre_alta),
    tem_sintoma(calafrio),
    tem_sintoma(dor_de_cabeca),
    tem_sintoma(dor_no_corpo),
    tem_sintoma(nausea),
    tem_sintoma(vomito),
    tem_sintoma(fadiga),
    tem_sintoma(fraqueza),
    tem_sintoma(ictericia),
    tem_sintoma(sangramento),
    tem_sintoma(insuficiencia_hepatica),
    tem_sintoma(insuficiencia_renal),
    tem_sintoma(falencia_multipla_dos_orgaos).

 diagnostico(tuberculose) :-
    tem_sintoma(tosse),
    tem_sintoma(dor_no_peito),
    tem_sintoma(perca_de_peso),
    tem_sintoma(fadiga),
    tem_sintoma(febre),
    tem_sintoma(suor_intenso),
    tem_sintoma(perca_de_apetite).
    
% Verificação da presença do sintoma
tem_sintoma(Sintoma) :- 
    sintomas(Sintoma).

% Diagnóstico
diagnosticar(Doenca) :-
    (diagnostico(Doenca) -> true;
    Doenca = 'De acordo com os sintomas selecionados,\nnenhum resultado foi encontrado.\nRecomendamos procurar um postinho mais perto.').
