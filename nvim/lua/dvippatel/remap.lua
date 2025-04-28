--`space pv` is shortcut for opening explorer
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Visual mode query
local function smooth_scroll(direction)
	local count = vim.v.count1
	local speed = 1
	local max_speed = 10

	local timer = vim.loop.new_timer()
	timer:start(
		0,
		30,
		vim.schedule_wrap(function()
			speed = math.min(speed * 1.3, max_speed)

			if direction == "up" then
				vim.cmd("normal! " .. math.floor(speed) .. "k")
			else
				vim.cmd("normal! " .. math.floor(speed) .. "j")
			end

			count = count - math.floor(speed)

			if count <= 0 then
				timer:close()
			end
		end)
	)
end
-- Create custom keymappings for smooth scrolling
vim.keymap.set("n", "k", function()
	smooth_scroll("up")
end)
vim.keymap.set("n", "j", function()
	smooth_scroll("down")
end)
vim.keymap.set("n", "<Up>", function()
	smooth_scroll("up")
end)
vim.keymap.set("n", "<Down>", function()
	smooth_scroll("down")
end)
