return function(PossibleWins, Placements, MoveCount)
	for _, Win in pairs(PossibleWins) do
		if Placements[Win[1]] ~= 0 and Placements[Win[1]] == Placements[Win[2]] and Placements[Win[1]] == Placements[Win[3]] then
			if Placements[Win[1]] == true then
				print('Computer wins')
				script.Parent.GameOver.Text = 'COMPUTER WINS\n\nYOU LOSE'
			elseif Placements[Win[1]] == false then
				print('User wins')
				script.Parent.GameOver.Text = 'ERROR 404\n\nFATHER NOT FOUND'
			end
			return Win
		end
	end
	if MoveCount == 9 then
		print('Draw')
		script.Parent.GameOver.Text = 'DRAW'
	end
	return false
end
