local m = require("src.model")
local f = require("src.funcs")
local HOUR = m.HOUR
local timedelta = m.timedelta
local dt = m.dt
local isHour = m.isHour
local isNotTeachingBreak = m.isNotTeachingBreak
local isDayWeek = m.isDayWeek
local isDayOfWeek = m.isDayOfWeek
local just = m.just
local dueTime = m.dueTime
local dueIn = m.dueIn
local justRepeats = m.justRepeats
local oneTimeTask = m.oneTimeTask
local lectureTasks = m.lectureTasks
local singleTasks = m.singleTasks
local quizTask = m.quizTask
local worksheetTasks = m.worksheetTasks
local dailyTask = m.dailyTask
local returntable = {
	oneTimeTask("Engn Team (TMC1)", dt(2026, 3, 30), dt(2026, 4, 19)),
	oneTimeTask("Engn Milestone 3", dt(2026, 3, 30), dt(2026, 4, 21)),
	oneTimeTask("Engn Self-Assessment Milestone 3", dt(2026, 4, 21), dt(2026, 4, 28)),
	oneTimeTask("Engn Milestone 4", dt(2026, 3, 30), dt(2026, 5, 12)),
	oneTimeTask("Engn Self-assessment Milestone 4", dt(2026, 5, 12), dt(2026, 5, 19)),
	oneTimeTask("Engn Reflection", dt(2026, 4, 20), dt(2026, 5, 29)),
	oneTimeTask("Engn Mid-Sem Test", dt(2026, 4, 20), dt(2026, 5, 6)),
	oneTimeTask("Engn Self Assessment", dt(2026, 4, 21, 10), dt(2026, 4, 28, 10)),
	oneTimeTask("Engn Rover Design Report", dt(2026, 4, 20), dt(2026, 5, 29)),
	oneTimeTask("Engn Team (TMC2)", dt(2026, 5, 25), dt(2026, 6, 1)),
	oneTimeTask("Cadetship ASD", dt(2026, 11, 1), dt(2027, 3, 1)),
	oneTimeTask("Math Test", dt(2026, 4, 26), dt(2026, 5, 5)),
	oneTimeTask("Comp Assignment 2", dt(2026, 5, 1), dt(2026, 5, 15)),
	{
		name = function(date, n)
			return "Math Week " .. (n + 6) .. " Assignment Q/Task"
		end,
		conditions = { isDayOfWeek(0), isNotTeachingBreak() },
		duetime = dueTime(timedelta(3)),
		checkstart = just(dt(2026, 3, 30)),
		checkrepeats = justRepeats(6),
	},
	{
		name = function(date, n)
			return "Math Week " .. (n + 6) .. " Assignment Reflection"
		end,
		conditions = { isDayOfWeek(0), isNotTeachingBreak() },
		duetime = dueTime(timedelta(5)),
		checkstart = just(dt(2026, 3, 30)),
		checkrepeats = justRepeats(6),
	},
	{
		name = function(date, n)
			return "Comp Week " .. (n + 6) .. " Lab"
		end,
		conditions = { isDayWeek({ 4, 4 }), isNotTeachingBreak() },
		duetime = dueTime(timedelta(7)),
		checkstart = just(dt(2026, 3, 30, 13)),
		checkrepeats = justRepeats(6),
	},
	quizTask("Math", "MatLab", dt(2026, 3, 30), timedelta(3), 6, 6),
	quizTask("Phys", "Workshop Quiz", dt(2026, 3, 30), timedelta(24, 12), 6, 6),
	quizTask("Phys", "Pre-Reading Quiz", dt(2026, 3, 30), timedelta(24, 12), 6, 6),
	quizTask("Phys", "Lectures", dt(2026, 3, 30), timedelta(5), 6, 6),
	{
		name = function(date, n)
			return "Phys Week " .. (n + 6) .. " Lab Prep"
		end,
		conditions = { isDayOfWeek(0), isNotTeachingBreak() },
		duetime = dueIn(2, 13),
		checkstart = just(dt(2026, 3, 30)),
		checkrepeats = justRepeats(6),
	},
	{
		name = function(date, n)
			return "Phys Week " .. (n + 6) .. " Lab Submission"
		end,
		conditions = { isDayWeek({ 2, 2 }), isHour(13), isNotTeachingBreak() },
		duetime = dueIn(1, 4),
		checkstart = just(dt(2026, 3, 30)),
		checkrepeats = justRepeats(6),
		checkstep = just(HOUR),
	},
	dailyTask("Anki"),
	lectureTasks("math", 6, {
		{ 1, dt(2026, 4, 14, 9) },
		{ 2, dt(2026, 4, 14, 9) },
	}, 7),
	lectureTasks("comp", 6, {
		{ 0, dt(2026, 4, 14, 16) },
		{ 1, dt(2026, 4, 14, 15) },
		{ 2, dt(2026, 4, 14, 12) },
		{ 3, dt(2026, 4, 14, 8) },
	}, 7),
	lectureTasks("engn", 6, {
		{ 0, dt(2026, 4, 14, 14) },
		{ 1, dt(2026, 4, 14, 16) },
	}, 7),
	worksheetTasks("Lambda Calculus", dt(2026, 4, 4), timedelta(5), 8, { 4, 6, 10 }),
	-- textBookTasks("Jstweart", dt(2026, 4, 4), dt(2026, 5, 4), { 6, 8, 7, 5, 8, 6, 7, 8, 5, 9, 8, 8, 9 }),
	singleTasks({
		"Understand Nullspaces",
		"vpython",
		"Comp lab 6 folds",
		"comp 5 final q",
		"make clear tabs task weekly",
		"textbook tasks",
		"engineering self ass(check notes)",
		"eigenvectors type shit za",
		"mathtask, may 05 4 pm test",
		"zotero, like set up",
		"anki",
		"anki maths",
		"anki engn",
		"anki comp",
		"google natural frequency of a pendulum",
		"challenge questions haskell lab",
	}),
}

return returntable
