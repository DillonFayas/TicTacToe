return function(PossibleWins, Placements, MoveCount)
	-- Take the middle spot if available
	if Placements['B2'] == 0 then
		Placements['B2'] = true
		script.Parent.Buttons['B2'].Text = 'O'
		print('I want the middle')
		return Placements
	end

	-- Could my opponent's next move render a win for them?
	for _, Win in pairs(PossibleWins) do
		local FreeSpace = nil
		local PersonalCount = 0
		local OpponentCount = 0
		for _, Space in pairs(Win) do
			if Placements[Space] == false then
				OpponentCount = OpponentCount + 1
			elseif Placements[Space] == true then
				PersonalCount = PersonalCount + 1
			else
				FreeSpace = Space
			end
		end
		if OpponentCount == 2 and FreeSpace then
			Placements[FreeSpace] = true
			script.Parent.Buttons[FreeSpace].Text = 'O'
			print('Had to stop the other guy')
			return Placements
		end
	end

	-- If my opponent has the middle, choose corners until I can't
	if Placements['B2'] == false then
		local OpenSpaces = {}
		for Space, Value in pairs(Placements) do
			if Value == 0 and Space ~= 'A2' and Space ~= 'B1' and Space ~= 'B3' and Space ~= 'C2' then
				table.insert(OpenSpaces, Space)
			end
		end
		if #OpenSpaces > 0 then
			local Choice = OpenSpaces[math.random(1, #OpenSpaces)]
			Placements[Choice] = true
			script.Parent.Buttons[Choice].Text = 'O'
			print('Need corners')
			return Placements
		end
	end

	-- For the first move, return a random spot
	if MoveCount == 1 then
		local OpenSpaces = {}
		for Space, Value in pairs(Placements) do
			if Value == 0 then
				table.insert(OpenSpaces, Space)
			end
		end
		local ChosenSpace = OpenSpaces[math.random(1, #OpenSpaces)]
		Placements[ChosenSpace] = true
		script.Parent.Buttons[ChosenSpace].Text = 'O'
		print('Just random for the first one')
		return Placements
	end

	-- Will my next move render me a win?
	for _, Win in pairs(PossibleWins) do
		local FreeSpace = nil
		local PersonalCount = 0
		local OpponentCount = 0
		for _, Space in pairs(Win) do
			if Placements[Space] == false then
				OpponentCount = OpponentCount + 1
			elseif Placements[Space] == true then
				PersonalCount = PersonalCount + 1
			else
				FreeSpace = Space
			end
		end
		if PersonalCount == 2 and FreeSpace then
			Placements[FreeSpace] = true
			script.Parent.Buttons[FreeSpace].Text = 'O'
			print('This will get me the win')
			return Placements
		end
	end
	
	-- Does my opponent have more than one corner?
	local OpponentCornerCount = 0
	--local ComputerCornerCount = 0
	if Placements['A1'] == false then
		OpponentCornerCount = OpponentCornerCount + 1
	end
	if Placements['C1'] == false then
		OpponentCornerCount = OpponentCornerCount + 1
	end
	if Placements['A3'] == false then
		OpponentCornerCount = OpponentCornerCount + 1
	end
	if Placements['C3'] == false then
		OpponentCornerCount = OpponentCornerCount + 1
	end
	--if Placements['A1'] == true then
	--	ComputerCornerCount = ComputerCornerCount + 1
	--end
	--if Placements['C1'] == true then
	--	ComputerCornerCount = ComputerCornerCount + 1
	--end
	--if Placements['A3'] == true then
	--	ComputerCornerCount = ComputerCornerCount + 1
	--end
	--if Placements['C3'] == true then
	--	ComputerCornerCount = ComputerCornerCount + 1
	--end
	if OpponentCornerCount == 2 --[[and ComputerCornerCount == 0]] then
		local OpenSpaces = {}
		for Space, Value in pairs(Placements) do
			if Value == 0 and Space ~= 'A1' and Space ~= 'C1' and Space ~= 'A3' and Space ~= 'C3' then
				table.insert(OpenSpaces, Space)
			end
		end
		if #OpenSpaces > 0 then
			local Choice = OpenSpaces[math.random(1, #OpenSpaces)]
			Placements[Choice] = true
			script.Parent.Buttons[Choice].Text = 'O'
			print('Only sides')
			return Placements
		end
	end
	
	-- Before random... very specific condition...
	if MoveCount == 3 then
		if not Placements['A1'] and not Placements['B3'] then
			local ChosenSpace = 'C3'
			Placements[ChosenSpace] = true
			script.Parent.Buttons[ChosenSpace].Text = 'O'
			print('Specific condition')
			return Placements
		end
		if not Placements['A1'] and not Placements['C2'] then
			local ChosenSpace = 'C3'
			Placements[ChosenSpace] = true
			script.Parent.Buttons[ChosenSpace].Text = 'O'
			print('Specific condition')
			return Placements
		end
		if not Placements['A3'] and not Placements['C1'] then
			local ChosenSpace = 'C1'
			Placements[ChosenSpace] = true
			script.Parent.Buttons[ChosenSpace].Text = 'O'
			print('Specific condition')
			return Placements
		end
		if not Placements['A3'] and not Placements['B1'] then
			local ChosenSpace = 'C1'
			Placements[ChosenSpace] = true
			script.Parent.Buttons[ChosenSpace].Text = 'O'
			print('Specific condition')
			return Placements
		end
		if not Placements['C3'] and not Placements['B1'] then
			local ChosenSpace = 'A1'
			Placements[ChosenSpace] = true
			script.Parent.Buttons[ChosenSpace].Text = 'O'
			print('Specific condition')
			return Placements
		end
		if not Placements['C3'] and not Placements['A2'] then
			local ChosenSpace = 'A1'
			Placements[ChosenSpace] = true
			script.Parent.Buttons[ChosenSpace].Text = 'O'
			print('Specific condition')
			return Placements
		end
		if not Placements['C1'] and not Placements['A2'] then
			local ChosenSpace = 'A3'
			Placements[ChosenSpace] = true
			script.Parent.Buttons[ChosenSpace].Text = 'O'
			print('Specific condition')
			return Placements
		end
		if not Placements['C1'] and not Placements['B3'] then
			local ChosenSpace = 'A3'
			Placements[ChosenSpace] = true
			script.Parent.Buttons[ChosenSpace].Text = 'O'
			print('Specific condition')
			return Placements
		end
	end
	
	-- Else? Random
	local OpenSpaces = {}
	for Space, Value in pairs(Placements) do
		if Value == 0 then
			table.insert(OpenSpaces, Space)
		end
	end
	local ChosenSpace = OpenSpaces[math.random(1, #OpenSpaces)]
	Placements[ChosenSpace] = true
	script.Parent.Buttons[ChosenSpace].Text = 'O'
	print('I guess nothing else so random')
	return Placements
end
