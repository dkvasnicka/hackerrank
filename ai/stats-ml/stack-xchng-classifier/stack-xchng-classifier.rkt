#lang typed/racket

(require/typed json
               [string->jsexpr (String -> (HashTable Symbol String))]) 

(require/typed lang/htdp-advanced
               [string-numeric? (String -> Boolean)])

(require/typed rnrs/io/ports-6
               [open-file-input-port (String -> Input-Port)])

(define stopwords
   (set
    "a" "about" "above" "across" "after" "afterwards" "again" "against" "all" "almost" "alone" "along" "already" "also" "although"
    "always" "am" "among" "amongst" "amoungst" "amount" "an" "and" "another" "any" "anyhow" "anyone" "anything" "anyway" "anywhere"
    "are" "aren't" "around" "as" "at" "back" "be" "became" "because" "become" "becomes" "becoming" "been" "before" "beforehand"
    "behind" "being" "below" "beside" "besides" "between" "beyond" "bill" "both" "bottom" "but" "by" "call" "can" "cannot"
    "can't" "co" "computer" "con" "could" "couldnt" "cry" "de" "describe" "detail" "do" "done" "down" "due" "during" "each"
    "eg" "eight" "either" "eleven" "else" "elsewhere" "empty" "enough" "etc" "even" "ever" "every" "everyone" "everything" "everywhere"
    "except" "few" "fifteen" "fify" "fill" "find" "fire" "first" "five" "for" "former" "formerly" "forty" "found" "four" "from"
    "front" "full" "further" "get" "give" "go" "had" "has" "hasnt" "have" "he" "hence" "her" "here" "hereafter" "hereby" "herein" "hereupon"
    "hers" "herself" "him" "himself" "his" "how" "however" "hundred" "i" "i'm" "ie" "if" "in" "inc" "indeed" "interest" "into" "is"
    "it" "it's" "itself" "keep" "last" "latter" "latterly" "least" "less" "ltd" "made" "many" "may" "me" "meanwhile" "might" "mill"
    "mine" "more" "moreover" "most" "mostly" "move" "much" "must" "my" "myself" "name" "namely" "neither" "never" "nevertheless" "next"
    "nine" "no" "nobody" "none" "noone" "nor" "not" "nothing" "now" "nowhere" "of" "off" "often" "on" "once" "one" "only" "onto"
    "or" "other" "others" "otherwise" "our" "ours" "ourselves" "out" "over" "own" "part" "per" "perhaps" "please" "put" "rather" "re"
    "same" "see" "seem" "seemed" "seeming" "seems" "serious" "several" "she" "should" "show" "side" "since" "sincere" "six" "sixty"
    "so" "some" "somehow" "someone" "something" "sometime" "sometimes" "somewhere" "still" "such" "take" "ten" "than" "that" "the"
    "their" "them" "themselves" "then" "thence" "there" "there's" "thereafter" "thereby" "therefore" "therein" "thereupon" "these" "they" "they're"
    "thick" "thin" "third" "this" "those" "though" "three" "through" "throughout" "thru" "thus" "to" "together" "too" "top" "toward" "towards"
    "twelve" "twenty" "two" "un" "under" "until" "up" "upon" "us" "very" "via" "was" "we" "we're" "well" "were" "what" "whatever" "when"
    "whence" "whenever" "where" "whereafter" "whereas" "whereby" "wherein" "whereupon" "wherever" "whether" "which" "while" "whither" "who" "whoever"
    "whole" "whom" "whose" "why" "will" "with" "within" "without" "would" "yet" "you" "you're" "your" "yours" "yourself" "yourselves"))

(define training-file (open-file-input-port "training.json"))

(struct doc ([topic : String] [tokenized : (Sequenceof String)]))

(: tokenize (String -> (Listof String)))
(define (tokenize str)
  (string-split 
    (string-downcase
      (string-replace str #px"\\p{P}" " "))))

(: normalize-json-doc ((HashTable Symbol String) -> doc))
(define (normalize-json-doc d)
  (doc (hash-ref d 'topic) 
       (in-sequences 
         (tokenize (hash-ref d 'question)) 
         (tokenize (hash-ref d 'excerpt)))))

(: extract-vocabulary ((Sequenceof doc) -> (Setof String)))
(define (extract-vocabulary docs)
  (for/fold ([voc ((inst set String))])
            ([d docs])
    (for/fold ([v : (Setof String) voc])
              ([w : String (doc-tokenized d)])
        (if (or (string-numeric? w) 
                (< (string-length w) 2)
                (set-member? stopwords w))
          v
          (set-add v w)))))

(: train (Input-Port -> (Setof String)))
(define (train tfile)
  (let* ([train-docs-count (string->number (cast (read-line tfile) String))]
         [train-docs (sequence-map (compose normalize-json-doc 
                                            string->jsexpr) 
                                   (in-lines tfile))]
         [vocabulary (extract-vocabulary train-docs)])
    vocabulary))

(train training-file)
