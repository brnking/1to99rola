#-----------------------------------------
# ---- Speedrun na Academia Criatura  ----
#-----------------------------------------


automacro navioNaufragado {
	exclusive 1
	InMap iz_int, iz_int01, iz_int02, iz_int03, iz_int04
	BaseLevel = 1
	call {
		call pararDeAtacar
		do move int_land 85 107
	}
}

automacro navioNaufragado_LadoDeFora {
	exclusive 1
	InMap int_land, int_land01, int_land02, int_land03, int_land04
	BaseLevel = 1
	NpcNear /Capitão|Captain/
	QuestInactive 21002 #Primeiros Passos#Entregue 2 Madeiras de Reparos para o Marinheiro. (...)
	call {
		[
		do conf -f naSequenciaDeSalvamento false
		do conf -f membroDoEden none
		do conf -f quest_atual none
		do conf -f saveMap_storage_sequence none
		do conf -f saveMap_wanted none
		do conf -f saveMap_kafra_position none
		do conf -f saveMap_sellNpc_position none
		do conf autoMoveOnDeath 1
		do conf autoMoveOnDeath_x none
		do conf autoMoveOnDeath_y none
		do conf autoMoveOnDeath_map none
		do conf saveMap none
		do conf saveMap_warpToBuyOrSell 0
		do conf sellAuto 0
		do conf storageAuto 0
		do conf storageAuto_npc none
		do conf getAuto_0 none
		do conf autoTalkCont 1
		do conf sitAuto_idle 0
		do conf sitAuto_hp_lower 40
		do conf sitAuto_hp_upper 80
		do conf itemsTakeAuto 0
		do conf itemsGatherAuto 0
		do conf lockMap none
		do conf attackAuto_inLockOnly 0
		do conf route_randomWalk 0
		do conf statsAddAuto_dontUseBonus 1
		do conf itemsMaxWeight 69
		do conf itemsMaxWeight_sellOrStore 68
		do conf itemsMaxNum_sellOrStore 99
		do iconf 12323 0 0 0
		do iconf 12324 0 0 0
		do iconf 569 0 0 0
		do iconf 7059 50 0 0
		do iconf 7060 50 0 0
		do iconf 13040 0 0 0
		do iconf 1243 0 0 0 # Adaga do Aprendiz
		do iconf 2112 0 0 0 # Vembrassa do Aprendiz
		do iconf 5055 0 0 0 # Chapéu de Ovo do Aprendiz
		do iconf 2414 0 0 0 # Sandálias do Aprendiz
		do iconf 2510 0 0 0 # Capuz do Aprendiz
		do iconf 2352 0 0 0 # Traje do Aprendiz
		do iconf 1201 0 0 0
		do iconf 13041 0 0 0
		do iconf 2393 0 0 0
		do iconf 2301 0 0 0
		do iconf 18730 0 0 0 #Chapéu de Calouro
		]
		do talk $.NpcNearLastBinId #Falando com o Capitão para pegar AGI
		do talk resp 1
		do move 51 59 #Indo até o Portal para Izlude
		do talknpc 51 59 r1 #Respondendo ao Portal para Izlude
		pause 1
		do talk resp 1
	}
}

automacro academiaCriatura_irPara {
	exclusive 1
	InMap izlude, izlude_a, izlude_b, izlude_c, izlude_d
	BaseLevel = 1
	NpcNotNear /Sprakki/
	call {
		do move iz_ac01 100 34 #Indo para Academia Criatura
	}
}

automacro academiaCriatura_falarComSprakki {
	exclusive 1
	InMap iz_ac01, iz_ac01_a, iz_ac01_b, iz_ac01_c, iz_ac01_d
	BaseLevel = 1
	NpcNear /Sprakki/
	call {
		do talk $.NpcNearLastBinId #Falando com Sprakki
	}
}

automacro academiaCriatura_equipar {
	exclusive 1
	BaseLevel = 2
	IsNotEquippedID topHead 18730, leftHand 2112, robe 2510, shoes 2414, armor 2352, rightHand 1243
	call {
		do pconf 18730 0 # Chapéu de Calouro
		do pconf 2510 0 # Capuz do Aprendiz
		do pconf 2414 0 # Sandálias do Aprendiz
		do pconf 2112 0 # Vembrassa do Aprendiz
		do pconf 1243 0 # Adaga do Aprendiz
		do pconf 2352 0 # Traje do Aprendiz
		call equiparSePossivel "topHead"   18730 # Chapéu de Calouro
		call equiparSePossivel "robe"	  2510 # Capuz do Aprendiz
		call equiparSePossivel "shoes"	 2414 # Sandálias do Aprendiz
		call equiparSePossivel "armor"	 2352 # Traje do Aprendiz
		call equiparSePossivel "leftHand"  2112 # Vembrassa do Aprendiz
		call equiparSePossivel "rightHand" 1243 # Adaga do Aprendiz
	}
}

automacro academiaCriatura_irParaHoon {
	exclusive 1
	BaseLevel = 2
	QuestInactive 7473 #Aula de Consumível#Dê um clique duplo no Suco de Maçã e depois, volte a falar com Bartolomeu!
	InInventoryID 569 = 0 #Poção de Aprendiz
	IsEquippedID topHead 18730, leftHand 2112, robe 2510, shoes 2414, armor 2352, rightHand 1243
	NpcNotNear /Hoon/
	call {
		do move izlude 123 215
	}
}

automacro academiaCriatura_falarComHoon {
	exclusive 1
	BaseLevel = 2
	QuestInactive 7473 #Aula de Consumível#Dê um clique duplo no Suco de Maçã e depois, volte a falar com Bartolomeu!
	InInventoryID 569 = 0 #Poção de Aprendiz
	IsEquippedID topHead 18730, leftHand 2112, robe 2510, shoes 2414, armor 2352, rightHand 1243
	NpcNear /Hoon/
	call {
		do talk $.NpcNearLastBinId #Falando com Hoon
		$suco = pegarNomePeloIdDoItem(531)
		do is $suco
		do talk $.NpcNearLastBinId #Falando com Hoon
		do conf route_randomWalk 1
		do conf itemsTakeAuto 2
		$potName = pegarNomePeloIdDoItem(569)
		do conf useSelf_item_0 $potName
		do conf useSelf_item_0_disabled 0
		do conf useSelf_item_0_hp < 60%
		call voltarAtacar
		do move prt_fild08
	}
}