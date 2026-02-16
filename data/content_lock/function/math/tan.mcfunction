# Tangent Calculator Function
# Input: tan_angle (angle in degrees, scaled by 1000, range: -89000 to 89000)
# Output: tan_result (tangent value scaled by 1000)
# Example: tan_angle = 45000 (45 degrees) -> tan_result ≈ 1000 (1.0)

# Store the input angle
$scoreboard players set #tan_input content_lock.temp1 $(angle)
#scoreboard players operation #tan_input content_lock.temp1 = @s tan_angle

# Normalize angle to positive for calculation
scoreboard players operation #tan_sign content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches ..-1 run scoreboard players operation #tan_input content_lock.temp1 *= #-1 content_lock.temp1

# Clamp to valid range (avoid tan(90°) = infinity)
execute if score #tan_input content_lock.temp1 matches 89001.. run scoreboard players set #tan_input content_lock.temp1 89000

# Lookup table for tangent values (angle in degrees * 1000 -> tan * 1000)
# tan(0°) = 0
execute if score #tan_input content_lock.temp1 matches 0..4999 run scoreboard players operation #tan_result content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 0..4999 run scoreboard players operation #tan_result content_lock.temp1 *= #175 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 0..4999 run scoreboard players operation #tan_result content_lock.temp1 /= #10000 content_lock.temp1

# tan(5°) ≈ 0.087
execute if score #tan_input content_lock.temp1 matches 5000..9999 run scoreboard players set #tan_result content_lock.temp1 87
execute if score #tan_input content_lock.temp1 matches 5000..9999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 5000..9999 run scoreboard players remove #tan_temp content_lock.temp1 5000
execute if score #tan_input content_lock.temp1 matches 5000..9999 run scoreboard players operation #tan_temp content_lock.temp1 *= #88 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 5000..9999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 5000..9999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(10°) ≈ 0.176
execute if score #tan_input content_lock.temp1 matches 10000..14999 run scoreboard players set #tan_result content_lock.temp1 176
execute if score #tan_input content_lock.temp1 matches 10000..14999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 10000..14999 run scoreboard players remove #tan_temp content_lock.temp1 10000
execute if score #tan_input content_lock.temp1 matches 10000..14999 run scoreboard players operation #tan_temp content_lock.temp1 *= #93 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 10000..14999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 10000..14999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(15°) ≈ 0.268
execute if score #tan_input content_lock.temp1 matches 15000..19999 run scoreboard players set #tan_result content_lock.temp1 268
execute if score #tan_input content_lock.temp1 matches 15000..19999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 15000..19999 run scoreboard players remove #tan_temp content_lock.temp1 15000
execute if score #tan_input content_lock.temp1 matches 15000..19999 run scoreboard players operation #tan_temp content_lock.temp1 *= #96 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 15000..19999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 15000..19999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(20°) ≈ 0.364
execute if score #tan_input content_lock.temp1 matches 20000..24999 run scoreboard players set #tan_result content_lock.temp1 364
execute if score #tan_input content_lock.temp1 matches 20000..24999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 20000..24999 run scoreboard players remove #tan_temp content_lock.temp1 20000
execute if score #tan_input content_lock.temp1 matches 20000..24999 run scoreboard players operation #tan_temp content_lock.temp1 *= #102 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 20000..24999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 20000..24999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(25°) ≈ 0.466
execute if score #tan_input content_lock.temp1 matches 25000..29999 run scoreboard players set #tan_result content_lock.temp1 466
execute if score #tan_input content_lock.temp1 matches 25000..29999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 25000..29999 run scoreboard players remove #tan_temp content_lock.temp1 25000
execute if score #tan_input content_lock.temp1 matches 25000..29999 run scoreboard players operation #tan_temp content_lock.temp1 *= #111 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 25000..29999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 25000..29999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(30°) ≈ 0.577
execute if score #tan_input content_lock.temp1 matches 30000..34999 run scoreboard players set #tan_result content_lock.temp1 577
execute if score #tan_input content_lock.temp1 matches 30000..34999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 30000..34999 run scoreboard players remove #tan_temp content_lock.temp1 30000
execute if score #tan_input content_lock.temp1 matches 30000..34999 run scoreboard players operation #tan_temp content_lock.temp1 *= #123 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 30000..34999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 30000..34999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(35°) ≈ 0.700
execute if score #tan_input content_lock.temp1 matches 35000..39999 run scoreboard players set #tan_result content_lock.temp1 700
execute if score #tan_input content_lock.temp1 matches 35000..39999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 35000..39999 run scoreboard players remove #tan_temp content_lock.temp1 35000
execute if score #tan_input content_lock.temp1 matches 35000..39999 run scoreboard players operation #tan_temp content_lock.temp1 *= #139 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 35000..39999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 35000..39999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(40°) ≈ 0.839
execute if score #tan_input content_lock.temp1 matches 40000..44999 run scoreboard players set #tan_result content_lock.temp1 839
execute if score #tan_input content_lock.temp1 matches 40000..44999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 40000..44999 run scoreboard players remove #tan_temp content_lock.temp1 40000
execute if score #tan_input content_lock.temp1 matches 40000..44999 run scoreboard players operation #tan_temp content_lock.temp1 *= #161 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 40000..44999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 40000..44999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(45°) ≈ 1.000
execute if score #tan_input content_lock.temp1 matches 45000..49999 run scoreboard players set #tan_result content_lock.temp1 1000
execute if score #tan_input content_lock.temp1 matches 45000..49999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 45000..49999 run scoreboard players remove #tan_temp content_lock.temp1 45000
execute if score #tan_input content_lock.temp1 matches 45000..49999 run scoreboard players operation #tan_temp content_lock.temp1 *= #192 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 45000..49999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 45000..49999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(50°) ≈ 1.192
execute if score #tan_input content_lock.temp1 matches 50000..54999 run scoreboard players set #tan_result content_lock.temp1 1192
execute if score #tan_input content_lock.temp1 matches 50000..54999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 50000..54999 run scoreboard players remove #tan_temp content_lock.temp1 50000
execute if score #tan_input content_lock.temp1 matches 50000..54999 run scoreboard players operation #tan_temp content_lock.temp1 *= #236 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 50000..54999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 50000..54999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(55°) ≈ 1.428
execute if score #tan_input content_lock.temp1 matches 55000..59999 run scoreboard players set #tan_result content_lock.temp1 1428
execute if score #tan_input content_lock.temp1 matches 55000..59999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 55000..59999 run scoreboard players remove #tan_temp content_lock.temp1 55000
execute if score #tan_input content_lock.temp1 matches 55000..59999 run scoreboard players operation #tan_temp content_lock.temp1 *= #295 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 55000..59999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 55000..59999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(60°) ≈ 1.732
execute if score #tan_input content_lock.temp1 matches 60000..64999 run scoreboard players set #tan_result content_lock.temp1 1732
execute if score #tan_input content_lock.temp1 matches 60000..64999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 60000..64999 run scoreboard players remove #tan_temp content_lock.temp1 60000
execute if score #tan_input content_lock.temp1 matches 60000..64999 run scoreboard players operation #tan_temp content_lock.temp1 *= #382 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 60000..64999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 60000..64999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(65°) ≈ 2.145
execute if score #tan_input content_lock.temp1 matches 65000..69999 run scoreboard players set #tan_result content_lock.temp1 2145
execute if score #tan_input content_lock.temp1 matches 65000..69999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 65000..69999 run scoreboard players remove #tan_temp content_lock.temp1 65000
execute if score #tan_input content_lock.temp1 matches 65000..69999 run scoreboard players operation #tan_temp content_lock.temp1 *= #505 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 65000..69999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 65000..69999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(70°) ≈ 2.747
execute if score #tan_input content_lock.temp1 matches 70000..74999 run scoreboard players set #tan_result content_lock.temp1 2747
execute if score #tan_input content_lock.temp1 matches 70000..74999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 70000..74999 run scoreboard players remove #tan_temp content_lock.temp1 70000
execute if score #tan_input content_lock.temp1 matches 70000..74999 run scoreboard players operation #tan_temp content_lock.temp1 *= #710 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 70000..74999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 70000..74999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(75°) ≈ 3.732
execute if score #tan_input content_lock.temp1 matches 75000..79999 run scoreboard players set #tan_result content_lock.temp1 3732
execute if score #tan_input content_lock.temp1 matches 75000..79999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 75000..79999 run scoreboard players remove #tan_temp content_lock.temp1 75000
execute if score #tan_input content_lock.temp1 matches 75000..79999 run scoreboard players operation #tan_temp content_lock.temp1 *= #1072 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 75000..79999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 75000..79999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(80°) ≈ 5.671
execute if score #tan_input content_lock.temp1 matches 80000..84999 run scoreboard players set #tan_result content_lock.temp1 5671
execute if score #tan_input content_lock.temp1 matches 80000..84999 run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 80000..84999 run scoreboard players remove #tan_temp content_lock.temp1 80000
execute if score #tan_input content_lock.temp1 matches 80000..84999 run scoreboard players operation #tan_temp content_lock.temp1 *= #1872 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 80000..84999 run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 80000..84999 run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# tan(85°) ≈ 11.430
execute if score #tan_input content_lock.temp1 matches 85000.. run scoreboard players set #tan_result content_lock.temp1 11430
execute if score #tan_input content_lock.temp1 matches 85000.. run scoreboard players operation #tan_temp content_lock.temp1 = #tan_input content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 85000.. run scoreboard players remove #tan_temp content_lock.temp1 85000
execute if score #tan_input content_lock.temp1 matches 85000.. run scoreboard players operation #tan_temp content_lock.temp1 *= #4714 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 85000.. run scoreboard players operation #tan_temp content_lock.temp1 /= #5000 content_lock.temp1
execute if score #tan_input content_lock.temp1 matches 85000.. run scoreboard players operation #tan_result content_lock.temp1 += #tan_temp content_lock.temp1

# Apply sign (if original angle was negative, negate result)
execute if score #tan_sign content_lock.temp1 matches ..-1 run scoreboard players operation #tan_result content_lock.temp1 *= #-1 content_lock.temp1

# Store result back to the entity
#scoreboard players operation @s content_lock.temp1 = #tan_result content_lock.temp1
return run scoreboard players get #tan_result content_lock.temp1