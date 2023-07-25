extends CanvasLayer


func play_fade_animation() -> void:

	Global.can_interact_with_screen = false
	$animation.play("dissolve")
	await $animation.animation_finished
	Global.can_interact_with_screen = true