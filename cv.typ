#import "@preview/vantage-cv:1.0.0": vantage-cv, styled-link, term, skill
#let configuration = yaml("configuration.yml")


#vantage-cv(
  name: configuration.contacts.name,
  position: configuration.position,
  links: (
    (name: "email", link: "mailto:"+ configuration.contacts.email),
    (name: "website", link: configuration.contacts.website.url, display: configuration.contacts.website.displayText),
    (name: "github", link: configuration.contacts.github.url, display: configuration.contacts.github.displayText),
    (name: "linkedin", link: configuration.contacts.linkedin.url, display: configuration.contacts.linkedin.displayText),
    (name: "location", link: "", display: configuration.contacts.address)
  ),
  tagline: (configuration.tagline),
  [

    == Experience

    #for job in configuration.jobs [
      === #styled-link(job.company.link)[#job.company.name] | #job.position \
      #term[#job.from --- #job.to][#job.location]
      #for point in job.description [
        - #point
      ]
    ]

  ],
  [

     == Core Competencies

    #for competencies in configuration.core_competencies [
      - #competencies\
    ]


    == Education

    #for edu in configuration.education [
      === #if edu.place.link != "" [
        #link(edu.place.link)[#edu.place.name]\
      ] else [
        #edu.place.name\
      ]

      #edu.from - #edu.to #h(1fr) #edu.location

      #edu.degree in #edu.major

    ]

    == Technical Skills

    #for skill in configuration.technical_skills [
      - *#skill.skill*: #skill.description
    ]

    == Languages

    #for language in configuration.languages [
      - *#language.name*: #language.proficiency
    ]

    == Methodology/Approach
    #for method in configuration.methodology [
      • #method
    ]

    == Personal Skills
    #for skills in configuration.personal_skills [
      - #skills
    ]

  ]
)
