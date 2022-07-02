local PossibleWins = {
	{'A1','A2','A3'},
	{'B1','B2','B3'},
	{'C1','C2','C3'},
	{'A1','B1','C1'},
	{'A2','B2','C2'},
	{'A3','B3','C3'},
	{'A1','B2','C3'},
	{'A3','B2','C1'},
}

local CurrentPlacements = {
	['A1'] = 0,
	['B1'] = 0,
	['C1'] = 0,
	['A2'] = 0,
	['B2'] = 0,
	['C2'] = 0,
	['A3'] = 0,
	['B3'] = 0,
	['C3'] = 0,
}

local PrintCurrentPlacements = require(script.Parent.PrintCurrentPlacements)
local CheckForWin = require(script.Parent.CheckForWin)
local RenderMove = require(script.Parent.RenderMove)
local Reset = require(script.Parent.Reset)

local MoveCount = 0

for _, Button in pairs(script.Parent.Buttons:GetChildren()) do
	Button.MouseButton1Click:Connect(function()
		if MoveCount % 2 == 0 then -- Even moves and first move
			if CurrentPlacements[Button.Name] == 0 then
				CurrentPlacements[Button.Name] = false
				Button.Text = 'X'
				if CheckForWin(PossibleWins, CurrentPlacements, MoveCount) then
					PrintCurrentPlacements(CurrentPlacements)
					CurrentPlacements = Reset()
					MoveCount = 0
					return
				end
				MoveCount = MoveCount + 1
				if MoveCount == 9 then
					CheckForWin(PossibleWins, CurrentPlacements, MoveCount)
					PrintCurrentPlacements(CurrentPlacements)
					CurrentPlacements = Reset()
					MoveCount = 0
					return
				end
				CurrentPlacements = RenderMove(PossibleWins, CurrentPlacements, MoveCount)
				if CheckForWin(PossibleWins, CurrentPlacements, MoveCount) then
					PrintCurrentPlacements(CurrentPlacements)
					CurrentPlacements = Reset()
					MoveCount = 0
					return
				end
				MoveCount = MoveCount + 1
			end
		end
	end)
end
