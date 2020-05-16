extends AudioStreamPlayer2D

var coinSFX = preload("res://Audio/coin.tres")

func play_coin_sfx():
	stream = coinSFX
	play()
