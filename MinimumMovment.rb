def minimumMovement(obstacleLanes)
  mat = []
  lane = 1
  moves = 0
  # Build the road
  obstacleLanes.each do |v|
    mat << [1, 0, 0] if v == 1
    mat << [0, 1, 0] if v == 2
    mat << [0, 0, 1] if v == 3
  end
  # Check if it's needed to change the path
  mat.each_with_index do |vec, i|
    next if vec[lane] == 0

    if vec[lane] != 0
      moves += 1
      lane = best_path(mat, i, lane)
    end
  end
  moves
end

# Method to calculate the best move @matrix = the road, @now = current index, @lane = current lane
# Used Variables
# @op1 = Counter for the first option based on current lane
# @op2 = Counter for the second option based on current lane
# @chk = A flag to run the loop
# @aux_ind = Counter to give the sight of how long can you go without surpass the matrix size, and not encountering any obstacle
def best_path(matrix, now, lane)
  op1 = 0
  op2 = 0
  if lane == 0
    chk = true
    aux_ind = 0
    while chk
      break if now + aux_ind >= matrix.size

      if matrix[now + aux_ind][1] == 0
        op1 += 1
        aux_ind += 1
      else
        chk = false
      end
    end
    chk = true
    aux_ind = 0
    while chk
      break if now + aux_ind >= matrix.size

      if matrix[now + aux_ind][2] == 0
        op2 += 1
        aux_ind += 1
      else
        chk = false
      end
    end
    op1 > op2 ? 1 : 2
  elsif lane == 1
    chk = true
    aux_ind = 0
    while chk
      break if now + aux_ind >= matrix.size

      if matrix[now + aux_ind][0] == 0
        op1 += 1
        aux_ind += 1
      else
        chk = false
      end
    end
    chk = true
    aux_ind = 0
    while chk
      break if now + aux_ind >= matrix.size

      if matrix[now + aux_ind][2] == 0
        op2 += 1
        aux_ind += 1
      else
        chk = false
      end
    end
    op1 > op2 ? 0 : 2
  elsif lane == 2
    chk = true
    aux_ind = 0
    while chk
      break if now + aux_ind >= matrix.size

      if matrix[now + aux_ind][0] == 0
        op1 += 1
        aux_ind += 1
      else
        chk = false
      end
    end
    chk = true
    aux_ind = 0
    while chk
      break if now + aux_ind >= matrix.size

      if matrix[now + aux_ind][1] == 0
        op2 += 1
        aux_ind += 1
      else
        chk = false
      end
    end
    op1 > op2 ? 0 : 1
  end
end
