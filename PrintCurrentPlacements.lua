return function(CurrentPlacements)
	local Readable = {
		['A1'] = '',	['B1'] = '',	['C1'] = '',
		['A2'] = '',	['B2'] = '',	['C2'] = '',
	}
	local ReadableBottom = {
		['A3'] = '',	['B3'] = '',	['C3'] = '',
	}
	for Index, Space in pairs(CurrentPlacements) do
		if Space == true then
			Readable[Index] = ' ̲O̲ ̲'
		elseif Space == false then
			Readable[Index] = ' ̲X̲ ̲'
		else
			Readable[Index] = ' ̲ ̲ ̲̲'
		end
	end
	for Index, Space in pairs(CurrentPlacements) do
		if Space == true then
			ReadableBottom[Index] = ' O '
		elseif Space == false then
			ReadableBottom[Index] = ' X '
		else
			ReadableBottom[Index] = '   '
		end
	end

	local FinalString = "\n\n ̲"..Readable['A1'].."|̲"..Readable['B1'].."|̲"..Readable['C1'].."\n ̲"..Readable['A2'].."̲|̲"..Readable['B2'].."|̲"..Readable['C2'].."\n "..ReadableBottom['A3'].."|"..ReadableBottom['B3'].."|"..ReadableBottom['C3'].."\n\n"
	print(FinalString)
end

--  ̲X̲
--  ̲O̲

--[[

 ̲ ̲ ̲ ̲|̲ ̲ ̲ ̲|̲ ̲ ̲
 ̲ ̲ ̲ ̲|̲ ̲ ̲ ̲|̲ ̲ ̲
    |   |
    
--]]
