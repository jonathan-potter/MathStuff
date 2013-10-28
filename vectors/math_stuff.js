(function (root) {
  var VM = root.VM = (root.VM || {});

  VM.vectorAddition = function (vector1, vector2) {
    return vector1.map(function(_, index) {
      return vector1[index] + vector2[index];
    });
  };

  VM.vectorSubtraction = function (vector1, vector2) {
    return vector1.map(function(_, index) {
      return vector1[index] - vector2[index];
    });
  };

  VM.vectorDotMultiplication = function (vector1, vector2) {
    return vector1.map(function(_, index) {
      return vector1[index] * vector2[index];
    });
  };

  // sum of all elements in a vector
  VM.sum = function(vector) {
    return vector.reduce(function(sum,element) {
      return sum + element;
    });
  }

  // scalar to vector multiplication
  VM.scalarMultiplication = function (scalar, vector) {
    return vector.map(function(element) {
      return scalar * element;
    });
  };

  // vector magnitude
  VM.vectorMagnitude = function (vector) {
    var partialsSquared = vector.map(function(element) {
      return Math.pow(element, 2);
    });
    var sumOfPartialsSquared = VM.sum(partialsSquared);

    return Math.sqrt(sumOfPartialsSquared);
  };

  // normalizes vector
  VM.vectorNormalize = function (vector) {
    var magnitude = VM.vectorMagnitude(vector);
    return vector.map(function(element) {
      return element / magnitude;
    });
  };

  // vector dot product
  VM.dotProduct = function (vector1, vector2) {
    var v2normalized = VM.vectorNormalize(vector2);

    var dotMultiplied = VM.vectorDotMultiplication(vector1,v2normalized);

    return VM.sum(dotMultiplied);
  };

  // nearest point on a line (defined by two points) to a given point
  VM.nearestPointOnLineToGivenPoint = function (line, point) {
    // equation
    // Closest Point:           Cp
    // first point on line:     s1
    // second point on line:    s2
    // vector from s1 to point: s1p
    // Line Segment:            S
    // Line Segment Magnitude:  Smag
    // normalized segment:      Snorm

    var s1 = line[0];
    var s2 = line[1];

    var s1p   = VM.vectorSubtraction(point,s1);
    var S     = VM.vectorSubtraction(s2,s1);
    var Smag  = VM.vectorMagnitude(S);
    var Snorm = VM.vectorNormalize(S);

    var dotProduct = VM.dotProduct(s1p, S);
    var s1Cp = VM.scalarMultiplication(dotProduct, Snorm);

    return VM.vectorAddition(s1,s1Cp);
  };

})(this);