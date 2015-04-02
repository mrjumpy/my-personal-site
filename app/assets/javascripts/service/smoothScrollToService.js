angular.module('smoothScrollToService', [])
    .factory('smoothScrollToService', function($window, $timeout) {
        return {
            scrollTo: function(newHash) {

                var startY = $window.pageYOffset,
                    stopY = elementYPosition(newHash),
                    distance = stopY - startY,
                    step = Math.round(distance / 25),
                    stepTransitionTime = Math.abs(Math.round(distance / 100)),
                    startLeapY = startY,
                    leapY = startY + step,
                    counter = 0;

                // Break total height into multiple steps and scroll each step individiually after
                // every stepTransitionTime.
                while (Math.abs(stopY - leapY) >= Math.abs(step)) {
                    leapY += step;
                    startLeapY = leapY;
                    counter++;
                    stepScrollTo(startLeapY, leapY, counter * stepTransitionTime);
                }

                /*if (stopY > startY) {
                  leapY = startY + step;
                  startLeapY = startY;
                  for (var i = startY; i < stopY; i += step) {
                    stepScrollTo(startLeapY, leapY, counter*stepTransitionTime);
                    startLeapY = leapY;
                    leapY += step;
                    if (leapY > stopY) {
                      leapY = stopY;
                    }
                    counter++;
                  }
                } else {
                  leapY = startY - step;
                  startLeapY = stopY;
                  for (var i = startY; i > stopY; i -= step) {
                    stepScrollTo(startLeapY, leapY, counter*stepTransitionTime);
                    startLeapY = leapY;
                    leapY -= step;
                    if (leapY < stopY) {
                      leapY = stopY;
                    }
                    counter++;
                  }
                }*/

                function stepScrollTo(startLeapY, leapY, transitionTime) {
                    $timeout(function() {
                        $window.scrollTo(startLeapY, leapY);
                    }, transitionTime);
                }

                function elementYPosition(newHash) {
                    var element = document.getElementById(newHash),
                        y = element.offsetTop,
                        node = element;

                    while (node.offsetParent && node.offsetParent != document.body) {
                        node = node.offsetParent;
                        y += node.offsetTop;
                    }

                    return y;
                }
            }
        };
    })

.directive('smoothScrollTo', function($window, $location, smoothScrollToService) {
    return {
        link: function(scope, element, attrs) {
            element.bind('click', function(evt) {
                // set the location.hash to the id of
                // the element you wish to scroll to.
                $location.hash(attrs.smoothScrollTo);
                // call $anchorScroll()
                //var eleOffset = element.offset().top
                smoothScrollToService.scrollTo(attrs.smoothScrollTo);
            });

        }
    };
});