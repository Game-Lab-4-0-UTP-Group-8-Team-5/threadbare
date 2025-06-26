# Script dentro de MuroColision.gd
extends StaticBody2D

func desbloquear():
	print("🔓 Muro desbloqueado")
	$CollisionShape2D.disabled = true
	hide()  # Opcional si quieres ocultarlo visualmente
