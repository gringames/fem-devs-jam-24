extends Node2D

@export var text_box: EndingTextBox

var end_lines: Array = 	["Anton§Congratulations! I received the report where you confirm the tree is ready to be transplanted outside!",
			"We made it, doctor! We made it! I can't believe it! After all this time! After all the effort!",
			"It took so much out of us. We had to make so many sacrifices. But it's done. It's finally done!",
			"And it was worth it, all of it. For this moment.",
			"...",
			"I can trust you, right? You told me you wouldn't judge me when I was ready to let my regrets out.",
			"I've been keeping this secret for very long. You wouldn't imagine how it has chased me, day and night.?",
			"I need to let it out. Tell someone. I think you will understand it now.",
			"Remember the day Alessandro, Kate and Mila left? I told you they decided to go outside because they realised we wouldn't have supplies to survive.",
			"A sacrifice made in silence so none of you would stop them... Three scientists that will be remembered as heroes...",
	"All lies.",
	"They didn't leave. They never decided to do so. I had to force them.",
	"When they went outside to check on what was left of our first attempt of a forest... I locked them out.",
	"We all knew food wouldn't be enough. Not for everyone. Not until this tree grew.",
	"I mean, even without them, we have been eating nothing but potato salad for the last 30 days!",
	"It would have been impossible to maintain so many people in here. Someone had to make the decision.",
	"You understand it, right? That we deserve this. The recognition.",
	"We are saving what's left of humanity. People like us who did whatever was needed to survive!",
			]

func _ready() -> void:
	text_box.connect("on_close", final_lines)
	text_box.set_pages(end_lines)
	text_box.appear() # TODO: wait on fade for this

func final_lines():
	pass
