return function()
	for i = 0, 2, .5 do
		script.Parent.GameOver.Visible = not script.Parent.GameOver.Visible
		wait(.5)
	end
	script.Parent.GameOver.Visible = false
	for _, Button in pairs(script.Parent.Buttons:GetChildren()) do
		Button.Text = ''
	end
	return {
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
end
