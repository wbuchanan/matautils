// Start Mata interpreter/session
mata:

// used to select indices for a collection of values
real colvector getIndices(transmorphic matrix data, 					 	 ///   
						  transmorphic rowvector pattern, |					 ///   
						  real rowvector colset) {

	// Stores the indices where the pattern matched
	real	colvector	matchIndices
	
	// Used for iterator below
	real	scalar		i
	
	// If no argument passed to colset parameter, create one that selects all 
	// columns from the matrix
	if (!args() == 3) colset = J(1, cols(data), (1..cols(data)))
	
	// Initializes the column vector with the match indicators
	matchIndices = J(rows(data), 1, .)
	
	// Loop over the rows of the matrix and populate the match index values
	for(i = 1; i <= rows(data); i++) matchIndices[i, 1] = data[i, colset] == pattern
	
	// Return the column vector with the matched indicators
	return(matchIndices)
	
} // End Function definition

// End Mata session
end
