function tests = test_check_num_mat
tests = functiontests(localfunctions)
end

function testMatrixOfNumbers(testCase)
actSolution = check_num_mat([1.0 2.0 3.0 4.0])
expSolution = 1
verifyEqual(testCase, actSolution, expSolution)
end
