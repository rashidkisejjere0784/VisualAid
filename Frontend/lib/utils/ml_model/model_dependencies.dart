//The bag of words expected to be used by the model
final vocabulary = [
  "a", "about", "access", "accessible", "account", "adapt", "adopting",
  "advancements", "advice", "africa", "ahead", "aloud", "an", "analyze", "and", "appear", "apps", "are", "area",
  "articulate", "assist", "assistive", "audiobooks", "australia", "bank", "be", "before", "beginners", "benefits",
  "best", "biological", "board", "body", "book", "break", "brewing", "briefly", "bring", "budget", "butterfly",
  "caes", "can", "capital", "caps", "car", "cats", "cedat", "cees", "change", "chapel", "characteristics", "chip",
  "chocolate", "chs", "circulatory", "city", "clarify", "climate", "closet", "cobams", "cocis", "coffee",
  "communicate", "complex", "components", "comprehend", "concept", "contained", "content", "contents",
  "convey", "cookies", "could", "create", "cultural", "cup", "cycle", "data", "describe", "destination",
  "detail", "details", "different", "direct", "direction", "directions", "directly", "disabilities",
  "discuss", "do", "doc", "document", "does", "dog", "down", "eastern", "effective", "elaborate", "encompasses",
  "energy", "entanglement", "environments", "enzymes", "escort", "even", "events", "exam", "examine", "excel",
  "exercise", "explain", "express", "family", "fashion", "favorite", "file", "finances", "find", "finding", "flat",
  "for", "forestry", "found", "from", "front", "function", "fusion", "game", "games", "gardening", "gate", "genre",
  "give", "go", "good", "ground", "guidance", "guide", "hall", "have", "health", "help", "historical", "holds",
  "homemade", "hospital", "how", "human", "i", "ice", "identify", "impact", "impairment", "improving", "in",
  "included", "inclusive", "indoor", "information", "inside", "interesting", "is", "item", "japan", "joke",
  "knit", "language", "lasagna", "latest", "lead", "leader", "learn", "learning", "level", "library", "lies", "life", "light", "lighten", "living", "location", "lumumba", "magic", "main", "make", "making", "management", "manual", "mary", "material", "me", "meditation", "mindfulness", "mitchel", "mobile", "mood", "mosque", "movie", "music", "my", "mystery", "narrate", "navigate", "navigating", "new", "night", "nkrumah", "nsibirwa", "nuclear", "object", "of", "oil", "on", "oral", "organize", "outline", "over", "overview", "pages", "paper", "path", "pathway", "pdf", "people", "perfect", "perform", "personal", "photosynthesis", "piano", "pitch", "place", "plants", "play", "podcast", "point", "polar", "pool", "positioned", "present", "presented", "process", "processes", "productivity", "provide", "purr", "quality", "quantum", "reach", "reaching", "read", "recipe", "recommend", "recommendations", "reference", "regular", "releases", "renewable", "review", "road", "role", "route", "routines", "rugby", "scarf", "school", "see", "seem", "seen", "senate", "share", "shed", "sheet", "show", "significance", "silk", "situated", "sleep", "smooth", "soap", "some", "sources", "southern", "specify", "spreadsheet", "stanbic", "steps", "stone", "straight", "stuart", "suggest", "summary", "surface", "swimming", "system", "technology", "tell", "terrain", "test", "text", "textbook", "textual", "that", "the", "their", "thing", "this", "thoughts", "through", "time", "tips", "to", "towards", "traditions", "travel", "trends", "trick", "type", "types", "university", "us", "vegetarian", "verbally", "vicinity", "view", "visual",
  "way", "western", "what", "whats", "whereabouts", "why", "with", "within", "work", "workout", "written", "you", "your",
];

// classification of the user's instructions
final classes = ['Instruction', 'Action', 'Irrelevant', 'hardware', 'software'];