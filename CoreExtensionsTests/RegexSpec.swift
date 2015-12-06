import Quick
import Nimble
import CoreExtensions

class RegexSpec: QuickSpec {
    override func spec() {
        describe("Regex standard initialization", {
            var regex: Regex!
            describe("init(pattern: String)", {
                
                beforeEach {
                    regex = Regex(pattern: "hello")
                }
                
                it("can instantiate without error") {
                    expect(regex.pattern).to(equal("hello"))
                }
                
                it("matches a pattern with .match()") {
                    expect(regex.match("hello_there")).to(beTruthy())
                }
            })
            
            describe("init with options", {
                beforeEach {
                    regex = Regex(pattern: "hello", options: NSRegularExpressionOptions.AnchorsMatchLines)
                }
                
                it("instantiates without error") {
                    expect(regex.pattern).to(equal("hello"))
                    expect(regex.options).to(
                        equal(NSRegularExpressionOptions.AnchorsMatchLines)
                    )
                }
            })
        })
        
        describe("Regex string literal initialization", {
            var regex: Regex!
            
            beforeEach {
                regex = "hello"
            }
            
            it("inits without errors") {
                expect(regex.pattern).to(equal("hello"))
            }
            
            it("can match against a pattern") {
                expect(regex.match("hello, my friend")).to(beTrue())
            }
        })
        
        describe("various literal conversions", {
            it("can convert from unicode scalar") {
                let reg = Regex(unicodeScalarLiteral: "a")
                expect(reg).toNot(beNil())
                expect(reg.pattern).to(equal("a"))
            }
            
            it("can convert from extended grapheme cluster") {
                let reg = Regex(extendedGraphemeClusterLiteral: "\u{65}")
                expect(reg).toNot(beNil())
                expect(reg.pattern).to(equal("\u{65}"))
            }
        })
        
        
        describe("the =~ operator", {
            describe("with a `normally` initialized Regex") {
                var regex: Regex!
                
                beforeEach {
                    regex = Regex(pattern: "hello")
                }
                
                it("matches with the =~ operator") {
                    let doesMatch = "hello, my friend" =~ regex
                    expect(doesMatch).to(beTrue())
                }
            }
        })
    }
}
