extends Node
class_name DayManager

@export var next_day_button: Clickable
@export var phone_call_text_box: TextBox
@export var task_list: TaskList
@export var newspaper: NewspaperArticle
@export var plant: Plant
@export var fade: BlackFade
@export var audioStreamPlayer: AudioStreamPlayer
@export var lights_off_sfx: AudioStreamPlayer
@export var lights_on_sfx: AudioStreamPlayer
@export var audioTrackHandler: TrackHandler
@export var phone: Phone
@export var light_switch: LightSwitch

@export_category("Action Buttons")
@export var water_button: Button
@export var trim_button: Button
@export var feed_button: Button
@export var check_temperature_button: Button


var day_info: Dictionary = {
	0 :
		{
		"tasks": [Plants.Tasks.Plant],
		"calls": [],
		"newspaper": []
		},
	1 :
		{
		"tasks":
			[
			Plants.Tasks.Water
			],
		"calls": 
			[
			"Anton§Hey, Anton Hopper here. Just making the routine check-up call.",
			"The tree hasn't died yet, has it? That's great news. Sorry if I am a bit nervous about this. We need to make it work.",
			"Anyway, let's go over your duties real quick. I need to get out to fix the damn vents that broke yesterday.",
			"Keep the tree alive. I don't need to remind you this one, right?",
			"Make sure you follow the care plan we prepared. Check your notepad if you don't remember what needs to be done each day.",
			"Also, Sai said he would leave the newspaper on your desk when it arrives.",
			"We'll receive it monthly now. I know it's a long time, but there isn't much we can do about it with how things are outside.",
			"Lastly, when you are finished, for the love of God, do not forget to turn the lights off. We have NO energy to waste.",
			"And that's basically it. I hope this turns out right...",
			"We've been talking about it during breakfast, you know? Hopes. An interesting topic in the times we live in.",
			"Anyway, I have to hurry and repair the vents. I swear I can hear a sandstorm forming in the distance.",
			"Everyone is relying on what we're doing here, buddy. So keep tight."
			],
		"newspaper":
			[
			"03-07-2084",
			"Flooding in Venice leaves bodies on the streets.",
			"The local police is trying to identify as many corpses as possible, and all citizens are encouraged to abandon their houses. The body of a dead dolphin has also been found in Saint Mark's Square, an animal that was believed to have gone extinct 20 years ago."
			]
		},
	2 : 
		{
		"tasks":
			[
			Plants.Tasks.Water,
			Plants.Tasks.CheckTemperature,
			],
		"calls": 
			[
			"Sai§What's up, mate? Your friendly molecular biologist Sai here!",
			"How's everything going? Are you eating all right? The food isn't exactly tasty here but, hey, it's better than nothing, right?",
			"I'm sorry I haven't had the chance to visit your lab lately. I left the newspaper while you were asleep and left. We are busy up here!",
			"There is a strong sand storm outside that is threatening to tear the facilities apart.",
			"Man, am I tired of cleaning the stupid sand. It gets into everything!",
			"Anyway, I don't know if Anton told you, but we've been talking about hopes this past month.",
			"You know, to try and cheer each other up.",
			"So, I was wondering... What is your hope for the future?%",
			"I am sure it will turn out well, mate.",
			"I wonder what Mila, Kate and Alessandro would've hoped for if they hadn't decided to leave...",
			"Well, I'll be on my way. It's me and one single sweeper against an entire sandstorm today!",
			],
		"newspaper":
			[
			"04-05-2084",
			"Oxygen drops to never-before-seen levels.",
			"Oxygen levels in the atmosphere keep dropping at a fast pace. Breathing outside of aconditionated areas has become an impossible task. Oxygen mask prices have increased to exhorbitant prices due to high demand."
			]
		},
	3 : 
		{
		"tasks":
			[
			Plants.Tasks.Water,
			Plants.Tasks.Trim,
			],
		"calls": 
			[
			"Mizuki§Hello, it's Mizuki Watanabe. I just wanted to check on the tree progress.",
			"What do you think of the soil I produced? Is it working fine?",
			"If you think I need to make a different one, just tell me so. I've been thinking about some nutrients I could add.",
			"By the way, I also have to tell you about food supplies. We are running short, so we'll need to cut rations in half.",
			"It's fine, though... I mean, since Kate, Alessandro and Mila left us...",
			"We will make it with what we have. Thanks to them.",
			"Do you ever wonder how they are? If they are still...?",
			"No, I can't think like this. I'm sure they are just fine. Waiting for us to finish our job here.",
			"I'll keep thinking about possible changes to the soil. Have a good day."
			],
		"newspaper":
			[
			"05-08-2084",
			"Human population at its lowest.",
			"The future of humanity is uncertain. The number of deaths doubles births each day. 90% of young people declare to have decided not to have kids. This newspaper would like to throw the following question: who would want to bring a baby into this world?"
			]
		},
	4 : 
		{
		"tasks":
			[
			Plants.Tasks.Water,
			],
		"calls": 
			[
			"Mizuki§Hello, it's Mizuki Watanabe. I came up with a better soil for the tree.",
			"I left it in your lab this morning with this month's newspaper. I took the old soil with me so you wouldn't get confused.",
			"I've seen the tree is growing well. I really hope it turns out to be a healthy, resilient tree in the end.",
			"Did Anton and Sai tell you about the \"hopes\" conversations we've been maintaining the past months?",
			"I don't usually like to talk about myself, but... I agreed to share my feelings with them. It feels important.",
			"Hopes are what keep us alive, aren't they? We live in a world without oxygen. The only thing fueling us are hopes now.",
			"It feels kind of poetic, don't you think? If our tree grows, we will get the oxygen back to then fuel our hopes.",
			"As for me, I hope I can go back to Kyoto when this is over. Walk alongside the Kamo river. See the herons take flight once more...",
			"If there is any left alive, that is.",
			"Sorry, I need to hang up. Sai is screaming about finding sand in his coffee again. Please, enjoy your day."
			],
		"newspaper":
			[
			"06-03-2084",
			"Great freezes turn northern Europe uninhabitable.",
			"Great amounts of population are gathering in southern France and northern Spain. The Mediterranean Sea seems to be humanity's last haven on Earth. The rest of the world has turned into either frozen landscape or scorched desert."
			]
		},
	5 : 
		{
		"tasks":
			[
			Plants.Tasks.Water,
			Plants.Tasks.Feed,
			Plants.Tasks.CheckTemperature,
			],
		"calls": 
			[
			"Sai§Hi, mate! Doctor sand-exterminator Banerjee on the phone!",
			"I'm actually terrible at getting rid of the sand, though. I think Mizuki is starting to get annoyed by my futile tries.",
			"I just wanted to check up on you. Are you alright? Feeling well and rested?",
			"I received a letter from my wife today. She attached a photo of our kids. If you saw how much they grew!",
			"I remember when they were like, 2 or 3, and I was asked to take care of them while my wife had a shower.",
			"I was reading a very interesting abstract on telomeres in some kind of Swedish bird and didn't notice the kiddo walking to the stairs.",
			"He was using one of those baby-walkers full of hanging toys. The noise they made when he fell all the way down!",
			"Mind you, this story is funny because he was totally fine after that, although my wife wasn't what you'd call happy.",
			"I tried to be a better dad after that, you know? So, instead of taking care of the kids, I went straight into the lab and researched.",
			"\"If I could just turn my kids' flesh into bullet-proof skin\", I thought.",
			"I'm just kidding! My wife didn't like that joke, either. It's a miracle she's never asked me for a divorce.",
			"I just hope my family is doing fine...",
			"But that's a regular hope everyone has, isn't it? Talking with all of you about hopes, I wanted to come up with one of my own.",
			"And I think... I think I hope I can look back, when I'm old, and be happy with how I spent my life.",
			"There! That's a rad hope from a cool guy, innit? Fits me just right.",
			"Phew, wasn't I chatty today? I'll go back to work now. Don't forget to eat your veggies!",
			],
		"newspaper":
			[
			"07-04-2084",
			"Scientists aren't finding a solution for rotting trees.",
			"Trees remain rotten everywhere. All kinds of saplings die within days. None of the three scientist groups investigating the issue (lead by Drs. Alejandra García, Anton Hopper and Boris Vassiliev) have reported any remarkable progress yet."
			]
		},
	6 : 
		{
		"tasks":
			[
			Plants.Tasks.Water,
			Plants.Tasks.Feed,
			Plants.Tasks.Trim,
			Plants.Tasks.CheckTemperature,
			],
		"calls": 
			[
			"Anton§Hey, Anton Hopper here. I wanted to check the tree status with you. It was looking healthy last time I monitored. You are watering it properly, right?",
			"Sorry, I don't mean to imply that you don't know how to do your job. It's just... This needs to work. It has to work.",
			"So... You heard about the hopes talk, yeah? Sai told us yours. But now that time has passed, I've been wondering more about...",
			"Regrets.",
			"I have some. They are deep, and dark, and sometimes keep me awake at night.",
			"And I... I think I need to share them with someone. Or they'll turn me mad.",
			"But not yet. I don't feel prepared. Still, do you promise you won't judge me once I have the courage to tell you?",
			"It's just... too hard. This has been eating me alive. But it's fine. It will be fine.",
			"Everything we're doing here will make it worthwhile.",
			"Did you read yesterday's newspaper? If so, you may be wondering why I didn't tell anyone from outside about our tree.",
			"Don't think too much about it. I don't want to give false hope and attract unneeded attention.",
			"Not until we are sure this tree will grow.",
			"Once we confirm it can survive in today's conditions... well. We will make history.",
			"We will appear in the news with a way brighter headline!",
			"Let's go back to work, Doctor. Make sure that tree doesn't die.",
			],
		"newspaper":
			[
			"08-06-2084",
			"No more hope.",
			"The are no more trees. No animals. No food. No place to live. Why? Why didn't we stop this before? Why didn't we listen when scientists warned us this would happen? Now it's too late. Planet Earth is officially dead."
			]
		},
	7 : 
		{
		"tasks":
			[],
		"calls": 
			[
			"Anton§Congratulations! I received the report where you confirm the tree is ready to be transplanted outside!",
			"We made it, Doctor! We made it! I can't believe it! After all this time! After all the effort!",
			"It took so much out of us. We had to make so many sacrifices. But it's done. It's finally done!",
			"And it was worth it, all of it. For this moment.",
			"...",
			"I can trust you, right? You told me you wouldn't judge me when I was ready to let my regrets out.",
			"I've been keeping this secret for very long. You wouldn't imagine how it has chased me, day and night.",
			"I need to let it out. Tell someone. I think you will understand it now.",
			"Remember the day Alessandro, Kate and Mila left? I told you they decided to go outside because they realised we wouldn't have supplies to survive.",
			"All lies.",
			"They didn't leave. They never decided to do so. I had to force them.",
			"When they went outside to check on what was left of our first attempt of a forest... I locked them out.",
			"We all knew food wouldn't be enough. Not for everyone. Not until this tree grew.",
			"I mean, even without them, we have been eating nothing but potato salad for the last 30 days!.",
			"It would have been impossible to mantain so many people in here. Someone had to make the decision.",
			"You understand it, right? That we deserve this. The recognision.",
			"We are saving what's left of humanity. People like us who did whatever was needed to survive!"
			],
		"newspaper":
			[]
		},
}


 # start with day 1 as day 0 is main menu
var current_day: int = 1

const tasks_key: String = "tasks"
const calls_key: String = "calls"
const newspaper_key: String = "newspaper"

# player has to plant seed on day 0, so init array with this value
var has_tent_today: Array[bool] = [true, false, false, false, false, false, false]
var todays_actions: Array[Plants.Tasks] = []

var current_tasks: Array


func _ready() -> void:
	next_day_button.connect("mouse_clicked_on_object", _end_day)
	fade.connect("fade_out_finished", _start_day)
	fade.connect("fade_in_finished", _next_day)
	
	water_button.connect("pressed", _on_water_sapling)
	trim_button.connect("pressed", _on_trim_sapling)
	feed_button.connect("pressed", _on_feed_sapling)
	check_temperature_button.connect("pressed", _on_check_temperature)
	
	_start_day()
	
	
	
func _end_day() -> void:
	phone._stop_ringing()
	_evaluate_todays_actions()
	
	current_day += 1
	lights_off_sfx.play()
	light_switch.switch_off()
	fade.fade_to_black()
	_stop_current_music_track()


func _start_day() -> void:
	if current_day == 7:
		_determine_ending()
		return
	
	_clear_todays_actions()
	if has_tent_today[current_day - 1]:
		plant.grow()
	plant.get_dry()
	
	play_track_for_current_day()
	fade.fade_from_black()
	lights_on_sfx.play()
	light_switch.switch_on()
	
	

func _next_day() -> void:
	_handle_day()


func _handle_day() -> void:	
	var current_calls: Array = day_info[current_day][calls_key]
	if _is_call_happening_today(current_calls):
		phone.ring()
		phone.activate()
		_set_up_phone_call(current_calls)
	else:
		phone.deactivate()
		
	current_tasks = day_info[current_day][tasks_key]
	_set_up_task_list(current_tasks)
	
	var news:Array = day_info[current_day][newspaper_key]
	if news.is_empty():
		newspaper.hide()
		return
	var current_newspaper: Array = news
	newspaper.set_article(current_newspaper)



func _is_call_happening_today(calls: Array) -> bool:
	return not calls.is_empty()
	

func _set_up_phone_call(content) -> void:
	phone_call_text_box.disappear()
	phone_call_text_box.set_pages(content)



func _set_up_task_list(content) -> void:
	task_list.disappear()
	var checklist: String = _create_tasks_checklist(content)
	task_list.set_text(checklist)

func _create_tasks_checklist(tasks: Array) -> String:
	if tasks.is_empty():
		return "1) Turn off the lights."
	
	var checklist: String = "Tasks for today:\n"
	var task_counter: int = 1
	
	for task in tasks:
		checklist +=  str(task_counter) + ") " + _task_to_string(task) + "\n"
		task_counter += 1
	return checklist + str(task_counter) + ") Turn off the lights."


func _task_to_string(task: Plants.Tasks) -> String:
	match task:
		Plants.Tasks.Plant: return "Plant the seedling."
		Plants.Tasks.Water: return "Water the sapling."
		Plants.Tasks.Feed: return "Feed the sapling."
		Plants.Tasks.Trim: return "Trim the sapling."
		Plants.Tasks.CheckTemperature: return "Check seedling temperature."
	return "Turn off lights"




func _stop_current_music_track() -> void:
	MusicTracker.current_music_offset = audioStreamPlayer.get_playback_position()


func play_track_for_current_day() -> void:
	audioStreamPlayer.stream = audioTrackHandler.get_track_for_day(current_day)
	audioStreamPlayer.play(MusicTracker.current_music_offset)
	
	
func _on_water_sapling() -> void:
	if todays_actions.has(Plants.Tasks.Water):
		print("I shouldn't waste water")
		return
	todays_actions.push_back(Plants.Tasks.Water)
	plant._get_wet()

	
func _on_feed_sapling() -> void:
	if todays_actions.has(Plants.Tasks.Feed):
		return
	todays_actions.push_back(Plants.Tasks.Feed)
	

func _on_trim_sapling() -> void:
	if todays_actions.has(Plants.Tasks.Trim):
		return
	todays_actions.push_back(Plants.Tasks.Trim)
	

func _on_check_temperature() -> void:
	if todays_actions.has(Plants.Tasks.CheckTemperature):
		return
	todays_actions.push_back(Plants.Tasks.CheckTemperature)
	

func _evaluate_todays_actions() -> void:
	# when empty, foreach is not executed so keep initial value
	var has_done_correct_tasks: bool = not todays_actions.is_empty()
	for action in todays_actions:
		if current_tasks.has(action) != todays_actions.has(action):
			has_done_correct_tasks = false
	has_tent_today[current_day] = has_done_correct_tasks
	

func _clear_todays_actions() -> void:
	todays_actions.clear()


func _determine_ending() -> void:
	var plant_withers: bool = has_tent_today.count(false) >= 3;
	
	if plant_withers:
		plant.wither()
		get_tree().change_scene_to_file("res://Endings/bad_ending.tscn")
	else:
		get_tree().change_scene_to_file("res://Endings/good_ending.tscn")
		
