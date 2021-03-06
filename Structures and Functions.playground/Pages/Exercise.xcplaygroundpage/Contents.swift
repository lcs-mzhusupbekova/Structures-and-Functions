/*:
 [Previous](@previous)
 
 The following statement is required to make the playground run.
 
 
 Please do not remove.
 */
import Foundation
/*:
 ## Exercise
 
 Write a function named **shortestDistance** that determines the shortest distance from a point on a Cartesian plane to a line on a Cartesian plane.
 
 The function header should look like this:
 
 ![example](example1.png "example")
 
 You can re-use the **Point** structure and the *distance* function.
 
 You should declare a new **Line** structure.
 
 Recall that a line is defined by it's *slope* and it's *vertical intercept*. What stored properties would you create for a **Line** structure?
 
 Recall that slope, in turn, is defined by it's *rise* and *run*. Could you create a **Slope** structure? What stored properties might it define?
 
 Recall that the shortest distance from a point to a line is the *perpendicular* distance from that point to the line.
 
 Here is a [complete example showing how to find the shortest distance from a point to a line](http://russellgordon.ca/lcs/shortest-distance-example.pdf), using symbolic algebra.
 
 Your job is to implement a solution in code that carries out the necessary mathematics. The beautiful part of this effort is that, once you've "taught" the computer how to do this correctly, you will never need to do this type of work manually again. 👍🏽😅🎉
 
 */

// Begin here...
//our given line is: y= -1/2x + 9.5
// our given point is: (6,1,5)

//define a structure representing a point on a Cartesian plane
struct Point {
    var x : Double = 0.0
    var y: Double = 0.0
}
// create an instance of the point from our problem
var cabinSite = Point(x: 6, y: 1.5)

// define a structure that represents a slope:
struct Slope {
    var rise : Double = 1.0
    var run : Double = 1.0
}


// define a structure that represents a line
struct Line {
    var slope: Slope = Slope(rise: 1.0, run : 1.0)
    var verticalIntercept : Double = 0.0
}

//create an instence of the line from our problem
var slopeOfExistingRoad = Slope(rise: -1, run: 2)
var existingRoad = Line(slope:slopeOfExistingRoad, verticalIntercept: 9.5)


/// returns the slope of a line perpendicular to the provided line
///
/// - Parameter givenLine: the line we are starting from
/// - Returns: the slope of the line that is perpendicular
func getSlopeOfPerpendicularLine(from givenLine: Line) -> Slope {
    givenLine.slope
    return Slope(rise: givenLine.slope.run, run: givenLine.slope.rise * -1)
}

//get the perpendicular slope ( the slope of the new road from the cabin to the existing road)
let perpendicularSlope = getSlopeOfPerpendicularLine(from: existingRoad)

func getVerticalIntercept (from p: Point,onLineWith m: Slope) ->Double {
//    get the slope as a decimal
     let mAsDecimal = m.rise / m.run
//    b= y-m *x
   return p.y - mAsDecimal * p.x

    }

let perpendicularLineVerticalIntercept = getVerticalIntercept(from: cabinSite, onLineWith: perpendicularSlope)

//define the equation ofthe new line ( the new road that needs to be built)

let newRoad = Line(slope:perpendicularSlope, verticalIntercept: perpendicularLineVerticalIntercept)


/// gets the point where the two lines in a Cartesian plane intersect
///
/// - Parameters:
///   - first: the first line
///   - second: the second line
/// - Returns: the point of intersection
func getPointOfIntersection( between first: Line, and second: Line) ->Point {
   
//    reminder: x= ( b1-b2) / (m2-m1)
    
// get the vertical intercept difference
    let verticalInterceptDifference = first.verticalIntercept - second.verticalIntercept
    
//    get the slope of difference
    
    let slopeDifference = second.slope.rise / second.slope.run - first.slope.rise / first.slope.run
    
//     get the actual x-value (abscissa)
    
    let x = verticalInterceptDifference / slopeDifference
    
//        get the actual y-value (substitution) (ordinate)
//    y = sl*x+b1
    
    let y = first.slope.rise / first.slope.run * x + first.verticalIntercept
//    return the point of the intersection
    
    return Point(x: x, y: y)
    
    }
        
//invoke the function to get the point of intersection
getPointOfIntersection(between: existingRoad, and: newRoad)





