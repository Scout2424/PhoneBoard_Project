import { WireframeButton } from "@/components/WireframeButton";
import { WireframeRecordButton } from "@/components/WireframeRecordButton";

const Index = () => {
  return (
    <div className="min-h-screen bg-background flex flex-col">
      {/* Header */}
      <header className="p-6 border-b border-border bg-card">
        <h1 className="text-3xl font-bold text-center text-foreground">
          PhoneBoard Project
        </h1>
      </header>

      {/* Main Content */}
      <main className="flex-1 p-6 flex flex-col justify-between max-w-4xl mx-auto w-full">
        {/* Sound Buttons Grid - 3 per row */}
        <div className="grid grid-cols-3 gap-4 mb-8">
          {[0, 1, 2, 3, 4, 5].map((index) => (
            <WireframeButton key={index} index={index} />
          ))}
        </div>

        {/* Record Button */}
        <div className="flex justify-center pb-8">
          <WireframeRecordButton />
        </div>
      </main>

      {/* Footer - Developer Credit */}
      <footer className="p-4 text-right">
        <p className="text-xs text-muted-foreground">
          Developed by <span className="font-medium">Villager Nr1</span> and{" "}
          <span className="font-medium">Villager Nr2</span>
        </p>
      </footer>
    </div>
  );
};

export default Index;
