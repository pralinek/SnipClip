# SnipClip
Simple and intuitional clipboard storage app.
Be careful! Usage is addicting.
# Why?
To create my own tools to outpace the competition

I started to work as IT support one year ago, without any it background only with simple idea and hard work  I was able to create an application that can improve general experience and make our work easier.

Windows clipboard can store only one item. When you copy something else, previous clipboard contents is owerwritten. So you can not find clipboard history by the means of Windows OS. 

That feature has many drawbacks for people working as service desk agent, or It technicians. As we have to search and gather lots of data. 

Our work can be summarized in four steps.

- Communication with the user

- Troubleshooting and gathering data

- Providing the solution

- Creating and closing the ticket.

My simple application can improve efficiency in all four aspects.

db.ticketCollection.aggregate([
  {
    $group: {
      _id: "$pid", // Group by user pid
      tickets: { $push: { state: "$state", ticketId: "$_id" } } // Collect all tickets and their states for each user
    }
  },
  {
    $project: {
      _id: 0, // Exclude this field from the output
      pid: "$_id", // Include user pid
      a: {
        $filter: {
          input: "$tickets",
          as: "ticket",
          cond: { $eq: ["$$ticket.state", 1] } // Filter tickets with state 1
        }
      },
      b: {
        $filter: {
          input: "$tickets",
          as: "ticket",
          cond: { $eq: ["$$ticket.state", 2] } // Filter tickets with state 2
        }
      },
      c: {
        $filter: {
          input: "$tickets",
          as: "ticket",
          cond: { $eq: ["$$ticket.state", 3] } // Filter tickets with state 3
        }
      },
      d: {
        $filter: {
          input: "$tickets",
          as: "ticket",
          cond: { $eq: ["$$ticket.state", 4] } // Filter tickets with state 4
        }
      }
    }
  }
])