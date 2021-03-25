

<h2>My Approach</h2>
<div class="container">
  <section>
    <h3>Thought Process</h3>
    <p>When I got the problem statement, these were my initial guiding questions:</p>
    <ol>
      <li>From a user's perspective, what is the problem really asking?</li>
      <li>What will success look like?</li>
      <li>What will I need to test to make sure it works?</li>
      <li>How will I model the data?</li>
      <li>How will I display the data?</li>
      <li>What pieces I have already written can I use to help me?</li>
    </ol>
  </section>

  <section>
    <h3>1. What is the problem really asking?</h3>
    <p>
      Take an input file, do some stuff with the data, spit back out intellegent analysis in a specified. The user says the data will always come in the expected format but I think I'll add some quick validations with reporting messages just to be sure to check for accidential typos or miss-clicks.
    </p>
    <p>
      There are two types of entries, drivers and trips. These will clearly be our two joined models. Driver has_many Trips and Trip belongs_to Driver. The Trip table can hold the start/end time (incase we want to do something with this data later), miles driven, an ID, and the driver_id it is linked to (Foregin key). I think I'll store them all as strings as I remember storing floats gets werid and the conversion is simple enough. The Drivers Table will just hold the driver's name and the ID that will help trips be linked to this driver.
    </p>
    <p>
      The data going into those two models will include a 24hr time format that will need to be converted into a float in order do to the calucation for speed, but again, I think I'll keep that data in the 24hr format to avoid storing floats.
    </p>
    <p>
      I wonder if the driver will always be entered before the trip tries to pair with that driver. Also, I wonder if there will ever be two drivers with the same name. I'll add in quick validations for both of those cases that will prevent the data from being entered for trips without already logged drivers and duplicate drivers.
    </p>
    <p>
      I know it asks for simple program, but this exercise is lending itself pretty well to a MVC architecture. I am certain I can make this in rails. That would let me pretty up the interface a little bit as well as add in a couple extra features like creating single Drivers and Trips without uploading a file. That will also help me manually test the code without having to upload a file each time. I am a bit concerned that making a rails app for this will be overkill, but I also know that Root is looking to see what I can do in terms of building a stand-alone program. Additionally, they did say to use any language or framework. I think they will be okay clicking a button and selecting the file instead of using a comand line to run the program.
    </p>
    <p>
      I will need to create tests that show that each of those cases won't brake the progarm and also imagine other instances that could reasonably happen.
    </p>
  </section>

  <section>
    <h3>2. What will success look like?</h3>
    <p>
      The evaluator will be so over the moon impressed with my solution that they will hire me on the spot! "Oh candidate!" they will exclaim. "Your code is just stucturely built! This is just the kind of eye toward usability and structurable soundness we are looking for!"
    </p>
    <p>
      On the program level, it needs to:
      <ol>
        <li>Accept input file</li>
        <li>Model the data appropriately</li>
        <li>Display the appropriate sorted calculated output</li>
        <li>Have a well documented README file</li>
        <li>...profit (get hired)</li>
      </ol>
    </p>
  </section>

  <section>
    <h3>3. What will I need to test to make sure it works?</h3>
    <p>
      Assumptions:
      <ul>
        <li>User will upload correct file type</li>
        <li>Text file will be space-separated values appearing exactly as in the problem (added validations to make sure of this)</li>
        <li>Drivers will only have one name</li>
        <li>Drivers will be added before trips that use that driver (validation will throw error if occurs)</li>
        <li>The user has the capacity to run a rails app on their machine</li>
      </ul>
    </p>
    <p>
      Things to test:
      <ul>
        <li>Model Validations</li>
        <li>Time conversion logic</li>
        <li>Speed calculation logic</li>
        <li>Exclution Logic</li>
        <li>Sorting solution display</li>
      </ul>
    </p>
  </section>

  <section>
    <h3>4. How will I model the data?</h3>
    <p>
      Driver table:
      <ul>
        <li>ID</li>
        <li>Name</li>
      </ul>
    </p>
    <p>
      Trip (DrivingRecord) table:
      <ul>
        <li>ID</li>
        <li>driver (foregin key)</li>
        <li>start_time</li>
        <li>end_time</li>
        <li>miles_driven</li>
      </ul>
    </p>
    <p>
      Trips will "belong_to" Driver and Driver "has_many" Trips. I will also make sure that the tabels are properly joined so that I can access associated trip data through the connected instance of the driver model.
    </p>
    <p>
      If I could be confident that all "miles_driven" would only have one number past the decimal point, I would multiply by 10 and store it as an intiger and just divide by 10 before using it in calculations or displaying it, but I cannot be sure of that. So, I'll store everything as strings.
    </p>
  </section>

  <section>
    <h3>5. How will I display the data?</h3>
    <p>
      The bare minimum I need is a single view with a button to upload a file and then display the sorted driver data as sorted, but I think I want to flush it out just a bit more.
    </p>
    <p>
      I'll add a upload view where the user can see all of my assumptions about the data they are uploading.
    </p>
    <p>
      A Trip view where the user can look at the raw Trip data she uploaded and a way for me to spot check and proof my program.
    </p>
    <p>
      A Driver view that will will be the "solution" to the problem. This will list all of the drivers along with aggragate data from every trip that driver has taken (that isn't under 5mph or over 100mph) sorted from most miles driven at the top to fewest at the bottom. The data displayed with each driver only calls for the name, total miles (rounded), and average speed (rounded), but I think I'll add in a column to say the total number of trips taken just to help with testing and validating that the data is displaying correctly.
    </p>
    <p>
      I think I'll throw in this README file as a home page for funzies. And while I'm at it, I think I'll copy some of Root's color scheme and styling from their branding guide online.
    </p>
    <p>
      The user will open the solution, navigate to the "upload records" view, upload the records, and then be taken to the drivers view to be shown the solution. The user can then clear the database with the button at the bottom, peruse the raw trip data in the Trip view, add a single trip or Driver record, or upload another file to add data to the persisting data.
    </p>
  </section>

  <section>
    <h3>6. Where can I go for what I need?</h3>
    <p>
      Much of the CRUD functionality of this rails app I have already built out when working on other projects. Additinally, the rails and ruby docs are incredibly well documented. A quick Google search will ususally point me in the correct direction from a StackOverflow answer.
    </p>
    <p>
      Be sure to give 5/5 stars and to tip your driver!
    </p>
  </section>
</div>
