describe("Vector", function() {
  var vector1 = [1,2,3,4,5];
  var vector2 = [6,7,8,9,10];

  var seg1 = [1,1];
  var seg2 = [1,0];

  beforeEach(function() {
    // do stuff
  });

  it("addition should add vectors element by element", function() {
    var vectorSum = VM.vectorAddition(vector1,vector2);;
    expect(vectorSum).toEqual([7,9,11,13,15]);
  });

  it("addition should subtract vectors element by element", function() {
    var vectorDifference = VM.vectorSubtraction(vector1,vector2);
    expect(vectorDifference).toEqual([-5,-5,-5,-5,-5]);
  });

  it("sum should add all of the elements in the vector", function () {
    var sum = VM.sum(vector1);
    expect(sum).toEqual(15);
  });

  it("dot multiplication should multiply vectors element by element", function () {
    var vectorDotMultiplication = VM.vectorDotMultiplication(vector1,vector2);
    expect(vectorDotMultiplication).toEqual([6,14,24,36,50]);
  });

  it("magnitude should return the vectors length", function() {
    expect(VM.vectorMagnitude([2,2])).toEqual(2 * Math.sqrt(2));
  });

  it("normalization should return a vector with the same direction but with magnitude 1", function () {
    var normalizedVector = VM.vectorNormalize([3,4]);
    expect(normalizedVector).toEqual([0.6, 0.8]);
  });

  it("dot product should return the dot prucuct of two vectors", function () {
    var dotProduct = VM.dotProduct(seg1,seg2);
    expect(dotProduct).toEqual(1);
  });

  it("nearestPointOnLineToGivenPoint returns what it says", function () {
    var nearestPoint = VM.nearestPointOnLineToGivenPoint([[0,0],[9,0]],[5,5]);
    expect(nearestPoint).toEqual([5,0]);
  });

  it("pointOnLineBetweenEndpoints returns true if the nearest point is between segment endpoints", function () {
    var nearestPoint = VM.pointOnLineBetweenEndpoints([[0,0],[9,9]],[5,5]);
    expect(nearestPoint).toEqual(true);
    var nearestPoint = VM.pointOnLineBetweenEndpoints([[0,0],[1,1]],[5,5]);
    expect(nearestPoint).toEqual(false);
  });

  it("correctly identifies which endpoint is closer to a given point", function () {
    var nearestPoint = VM.closerEndpointToPoint([[0,0],[1,1]],[2,2])
    expect(nearestPoint).toEqual([1,1])
    var nearestPoint = VM.closerEndpointToPoint([[0,0],[1,1]],[-1,-1])
    expect(nearestPoint).toEqual([0,0])
  });

  it("nearestPointOnLineSegmentToGivenPoint returns the closest spot on a line segment to a point", function () {
    expect(VM.nearestPointOnLineSegmentToGivenPoint([[0,0],[9,0]],[5,5])).toEqual([5,0]);
    expect(VM.nearestPointOnLineSegmentToGivenPoint([[0,0],[9,0]],[-5,5])).toEqual([0,0]);
  });

});