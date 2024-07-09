import type { Meta, StoryObj } from "@storybook/react";
import Text from "./Text";

//👇 This default export determines where your story goes in the story list
const meta: Meta<typeof Text> = {
  component: Text,
};

export default meta;
type Story = StoryObj<typeof Text>;

export const FirstStory: Story = {
  args: {},
};
